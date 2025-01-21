#include <stdbool.h>
#include <stdlib.h>

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

void PRINT(Program *program) {
    if (!stack_index) error("Stack is empty.");
    eval(program);

    if (get_type(stack[stack_index-1]) == STRING) {
        int size = strlen(stack[stack_index-1]) - 2;

        char unquoted[size];
        strncpy(unquoted, stack[stack_index-1] + 1, size);
        unquoted[size] = 0;

        printf("token: %s\n", unquoted);
    } else printf("token: %s\n", stack[stack_index-1]);

    free(stack[stack_index--]);
}

int main(int argc, char** argv) {
    if (argc < 2) error("Repl not implemented yet.\n");

    Program program = read_file(argv[1]);
    
    upsert("print", PRINT, true);
    upsert("hello", "[hello]", false);

    interpret(&program);
    debug_stack();
}
