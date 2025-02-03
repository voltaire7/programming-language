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
    args(program, 1);

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
            args(program, 1);

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
    args(program, 1);
    push(unquote(pop()));
}

void LET(Program *program) {
    Token token = get_token(program);
    Type type = get_type(token);

    switch (type) {
        case NUMBER:
            error("Cannot accept numbers for assignment: %s", token);
        case STRING:
            args(program, length(token));
            Program *symbols = &(Program){ .code = unquote(token), .size = strlen(token), .scope_static = program };
            Token symbol;
            while ((symbol = get_token(symbols))) {
                upsert(program, symbol, pop(), false);
            }
            free(token);
            break;
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
        case STRING:
            args(program, length(token));
            Program *symbols = &(Program){ .code = unquote(token), .size = strlen(token), .scope_static = program };
            while ((token = get_token(symbols))) {
                Variable *var = find(program, token);
                if (!var) error("Varible not bound: '%s'\n", token);
                var->value = pop();
            }
            free(token);
            break;
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
    args(program, 1);
    exit(atoi(pop()));
}

void DO(Program *program) {
    args(program, 1);
    char *value = unquote(pop());
    interpret(&(Program){ .code = value, .size = strlen(value), .scope_static = program, .scope_dynamic = program });
}

void REDUCE(Program *program) {
    int old = stack_index;

    args(program, 1);
    Token token = pop();
    if (get_type(token) != STRING) {
        push(token);
        return;
    }
    interpret(&(Program){ .code = unquote(token), .size = strlen(token), .scope_static = program, .scope_dynamic = program });

    int size = 1;
    Token acc = malloc(size+1);
    while (old != stack_index) {
        Token token = pop();
        int token_size = strlen(token);
        size += token_size + 1;
        Token new = malloc(size+1);
        new[0] = ' ';
        strncpy(new + 1, token, token_size);
        strncpy(new + 1 + token_size, acc, size - token_size - 2);
        free(token), free(acc);
        acc = new;
    }
    if (size == 1) acc = realloc(acc, ++size + 1);
    acc[0] = '[';
    acc[size-1] = ']';
    acc[size] = 0;
    push(acc);
}

void REVERSE(Program *program) {
    int old = stack_index;

    args(program, 1);
    Token token = pop();
    if (get_type(token) != STRING) {
        push(token);
        return;
    }
    interpret(&(Program){ .code = unquote(token), .size = strlen(token), .scope_static = program, .scope_dynamic = program });

    int size = 1;
    Token acc = malloc(size+1);
    while (old != stack_index) {
        Token token = pop();
        int token_size = strlen(token);
        size += token_size + 1;
        Token new = malloc(size+1);
        new[size - token_size - 2] = ' ';
        strncpy(new, acc, size - token_size - 2);
        strncpy(new + 1 + size - token_size - 2, token, token_size);
        free(token), free(acc);
        acc = new;
    }
    if (size == 1) acc = realloc(acc, ++size + 1);
    acc[0] = '[';
    acc[size-1] = ']';
    acc[size] = 0;
    push(acc);
}

void DEBUG(Program *program) {
    args(program, 1);
    Token token = pop();
    printf("%s\n", token);
    free(token);
}

void ADD(Program *program) {
    args(program, 2);
    Token token1 = pop(), token2 = pop();
    if (get_type(token1) != NUMBER || get_type(token1) != NUMBER) {
        error("Arithmetic operator do not support string: %s or %s", token1, token2);
    }
    double arg1 = atof(token1), arg2 = atof(token2);
    free(token1), free(token2);
    push(ftoa(arg1 + arg2));
}

void SUB(Program *program) {
    args(program, 2);
    Token token1 = pop(), token2 = pop();
    if (get_type(token1) != NUMBER || get_type(token1) != NUMBER) {
        error("Arithmetic operator do not support string: %s or %s", token1, token2);
    }
    double arg1 = atof(token1), arg2 = atof(token2);
    free(token1), free(token2);
    push(ftoa(arg1 - arg2));
}

void MUL(Program *program) {
    args(program, 2);
    Token token1 = pop(), token2 = pop();
    if (get_type(token1) != NUMBER || get_type(token1) != NUMBER) {
        error("Arithmetic operator do not support string: %s or %s", token1, token2);
    }
    double arg1 = atof(token1), arg2 = atof(token2);
    free(token1), free(token2);
    push(ftoa(arg1 * arg2));
}

void DIV(Program *program) {
    args(program, 2);
    Token token1 = pop(), token2 = pop();
    if (get_type(token1) != NUMBER || get_type(token1) != NUMBER) {
        error("Arithmetic operator do not support string: %s or %s", token1, token2);
    }
    double arg1 = atof(token1), arg2 = atof(token2);
    free(token1), free(token2);
    push(ftoa(arg1 / arg2));
}

void DUP(Program *program) {
    args(program, 1);
    Token token = pop();
    push(token), push(strdup(token));
}

void ARGS(Program *program) {
    args(program, 1);
    Token token = pop();
    switch (get_type(token)) {
        case NUMBER: {
            int goal = stack_index + atof(token);
            while (stack_index < goal) {
                int sp = stack_index;
                eval(program->scope_dynamic, true);
                if (sp == stack_index) error("Operand returned nothing.");
            }
        } break;
        case STRING:
            error("Not implemented yet.");
        case SYMBOL:
            error("Invalid argument: '%s'\n", token);
    }
    free(token);
}

void LENGTH(Program *program) {
    REDUCE(program);
    Token token = pop();
    push(ftoa(length(token)));
}

void SWAP(Program *program) {
    args(program, 2);
    Token t1 = pop(), t2 = pop();
    push(t2), push(t1);
}

void NOT_IMPLEMENTED(Program *program) {
    error("Function not implemented yet.");
}

void IF(Program *program) {
    args(program, 3);
    Token condition = pop(), if_ = pop(), else_ = pop();
    Token body = strcmp(condition, "[]") && strcmp(condition, "0") && strcmp(condition, "\"\"") ? if_ : else_;
    interpret(&(Program){ .code = unquote(body), .size = strlen(body), .scope_static = program });
    free(condition), free(if_), free(else_);
}

void FOR(Program *program) {
    REDUCE(program);
    args(program, 1);
    Token body = unquote(pop()), list = pop();
    switch (get_type(list)) {
        case NUMBER: {
            Token temp = range(0, atof(list));
            free(list);
            list = temp;
        }
        case STRING: {
            unquote(list);
            Program *program_list = &(Program){ .code = unquote(list), .size = strlen(list), .scope_static = program };
            args(program_list, 1);
            printf("debug: %s\n", append("", ""));
            // interpret(&(Program){ .code = unquote(body), .size = strlen(body) });
            // printf("debug: %s\n", list);
        } break;
        case SYMBOL:
            error("Symbol not supported as list for loop.");
    }
    printf("%s, %s\n", list, body);
}
