#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "env.h"
#include "eval.h"
#include "shared.h"
#include "util.h"

extern char *stack[STACK_SIZE];
extern int stack_index;

void FORMAT(Program *program) {
    eval(program);

    char *fmt = pop();
    int size = strlen(fmt);
    char *result = malloc(size);

    bool is_quote = *fmt == '[' || *fmt == '"';
    int j = 0;
    for (int i = is_quote; fmt[i + is_quote]; i++, j++) {
        if (fmt[i] == '\\') {
            switch (fmt[++i]) {
                case '\\':
                    result[j] = '\\';
                    break;
                case 'n':
                    result[j] = '\n';
                    break;
                case '"':
                    if (fmt[0] != '"') result[j++] = '\\';
                    result[j] = '"';
                    break;
                case '[':
                    if (fmt[0] != '[') result[j++] = '\\';
                    result[j] = '[';
                    break;
                case ']':
                    if (fmt[0] != '[') result[j++] = '\\';
                    result[j] = ']';
                    break;
                default: error("Invalid escape character: '\\%c'", fmt[i]);
            }
        } else if (fmt[i] == '%') {
            eval(program);

            char *value = pop();
            int value_size = strlen(value);
            bool is_quote = value[0] == '[' || value[0] == '"';
            char *temp = realloc(result, size + value_size - is_quote * 2);

            if (!temp) error("Failed to realloc memory.");
            result = temp;
            strncpy(result+j, value + is_quote, j + value_size - is_quote);
            j += value_size - 1 - is_quote * 2;

            free(value);
        } else result[j] = fmt[i];
    }
    result[j] = 0;
    push(result);
}

void PRINT(Program *program) {
    FORMAT(program);
    printf("%s", pop());
    free(stack[stack_index]);
}

void PRINTLN(Program *program) {
    PRINT(program);
    putchar('\n');
}

void UNQUOTE(Program *program) {
    eval(program);
    push(unquote(pop()));
}

void LET(Program *program) {
    Token token = get_token(program);
    Type type = get_type(token);

    switch (type) {
        case NUMBER:
            error("Cannot accept numbers for assignment: %s", token);
        case STRING: {
            Program *symbols = &(Program){ .code = unquote(token), .size = strlen(token), .next = program };
            while ((token = get_token(symbols))) {
                eval(program);
                upsert(program, token, pop(), false);
            }
            free(token);
        } break;
        case SYMBOL:
            UNQUOTE(program);
            upsert(program, token, pop(), false);
            break;
    }
}

void SET(Program *program) {
    Token token = get_token(program);
    Type type = get_type(token);

    switch (type) {
        case NUMBER:
            error("Cannot accept numbers for assignment: %s", token);
        case STRING: {
            Program *symbols = &(Program){ .code = unquote(token), .size = strlen(token), .next = program };
            while ((token = get_token(symbols))) {
                eval(program);
                Variable *var = find(program, token);
                if (!var) error("Varible not bound: '%s'\n", token);
                var->value = pop();
            }
            free(token);
        } break;
        case SYMBOL:
            UNQUOTE(program);
            Variable *var = find(program, token);
            if (!var) error("Varible not bound: '%s'\n", token);
            var->value = pop();
            break;
    }
}

void DEBUG_STACK(Program *program) {
    debug_stack();
}

void HALT(Program *program) {
    exit(0);
}

void EXIT(Program *program) {
    eval(program);
    exit(atoi(pop()));
}

void DO(Program *program) {
    eval(program);
    char *value = unquote(pop());
    interpret(&(Program){ .code = value, .size = strlen(value), .next = program });
}

void REDUCE(Program *program) {
    int old = stack_index;
    DO(program);
    int size = 2;
    Token acc = malloc(size);
    while (old != stack_index) {
        Token token = pop();
        int token_size = strlen(token);
        size += token_size + 1;
        Token new = malloc(size);
        new[0] = ' ';
        strncpy(new + 1, token, token_size);
        strncpy(new + 1 + token_size, acc, size - token_size - 3);
        free(token), free(acc);
        acc = new;
    }
    if (size == 2) acc = realloc(acc, ++size);
    acc[0] = '[';
    acc[size-2] = ']';
    acc[size-1] = 0;
    push(acc);
}

void DEBUG(Program *program) {
    eval(program);
    printf("%s\n", pop());
}

void ADD(Program *program) {
    args(program, 2);
    Token token2 = pop(), token1 = pop();
    double arg1 = atof(token1), arg2 = atof(token2);
    free(token1), free(token2);
    printf("%g %g\n", arg1, arg2);
    push(ftoa(arg1 + arg2));
}
