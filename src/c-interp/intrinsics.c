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
            Program *symbols = &(Program){ .code = unquote(token), .size = strlen(token) };
            while ((token = get_token(symbols))) {
                eval(program);
                upsert(token, pop(), false);
            }
            free(token);
        } break;
        case SYMBOL:
            UNQUOTE(program);
            upsert(token, pop(), false);
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
    int exit_code = atoi(pop());
    exit(exit_code);
}
