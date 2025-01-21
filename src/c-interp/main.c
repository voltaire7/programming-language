#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "shared.h"
#include "env.c"
#include "util.c"

char *stack[STACK_SIZE] = {};
int stack_index = 0;

void eval(Program *program);
void interpret(Program *program);

void eval(Program *program) {
    Token token = get_token(program);
    if (!token) return;

    Type type = get_type(token);
    switch (type) {
        case NUMBER:
        case STRING:
            stack[stack_index++] = token;
            break;
        case SYMBOL: {
            Variable *var = find(token);
            if (!var) error("Variable not bound '%s'\n", token);

            if (var->is_intrinsic) ((void (*)(Program *)) var->value)(program);
            else interpret(&(Program){ .code = var->value, .size = strlen(var->value) });

            free(token);
        } break;
    }
}

void interpret(Program *program) {
    for (int i = 0; program->position < program->size; i++) {
        eval(program);
    }
}

void FORMAT(Program *program) {
    eval(program);
    if (!stack_index) error("Stack is empty.\n");

    char *fmt = stack[--stack_index];
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
                default: error("Invalid escape character: '\\%c'\n", fmt[i]);
            }
        } else if (fmt[i] == '%') {
            eval(program);
            if (!stack_index) error("Stack is empty.\n");

            char *value = stack[--stack_index];
            int value_size = strlen(value);
            bool is_quote = value[0] == '[' || value[0] == '"';
            char *temp = realloc(result, size + value_size - is_quote * 2);

            if (!temp) error("Failed to realloc memory.\n");
            result = temp;
            strncpy(result+j, value + is_quote, j + value_size - is_quote);
            j += value_size - 1 - is_quote * 2;

            free(value);
        } else result[j] = fmt[i];
    }
    result[j] = 0;
    stack[stack_index++] = result;
}

void PRINT(Program *program) {
    FORMAT(program);
    if (!stack_index) error("Stack is empty.\n");
    printf("%s", stack[--stack_index]);
    free(stack[stack_index]);
}

int main(int argc, char** argv) {
    if (argc < 2) error("Repl not implemented yet.\n");

    Program program = read_file(argv[1]);
    
    upsert("print", PRINT, true);
    upsert("format", FORMAT, true);
    upsert("hello", "[hello\\n]", false);

    interpret(&program);
    debug_stack();
}
