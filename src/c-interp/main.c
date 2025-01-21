#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "shared.h"
#include "env.c"
#include "util.c"

char *stack[STACK_SIZE] = {};
int stack_index = 0;

void PRINT() {
    printf("Hello, World!\n");
}

void interpret(Program program) {
    for (int i = 0; program.position < program.size; i++) {
        Token token = get_token(&program);
        if (!token) break;

        Type type = get_type(token);
        switch (type) {
            case NUMBER:
            case STRING:
                stack[stack_index++] = token;
                break;
            case SYMBOL: {
                Variable *var = find(token);
                if (!var) error("Variable not bound '%s'\n", token);

                if (var->is_intrinsic) ((void (*)()) var->value)();
                else interpret((Program){ .code = var->value, .size = strlen(var->value) });

                free(token);
            } break;
        }
    }
}

int main(int argc, char** argv) {
    if (argc < 2) error("Repl not implemented yet.\n");

    Program program = read_file(argv[1]);
    
    upsert("print", PRINT, true);
    Variable *var = find("print");

    interpret(program);
    debug_stack();
}
