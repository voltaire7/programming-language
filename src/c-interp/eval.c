#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "shared.h"
#include "util.h"
#include "eval.h"
#include "env.h"

void eval(Program *program) {
    Token token = get_token(program);
    if (!token) return;

    Type type = get_type(token);
    switch (type) {
        case NUMBER:
        case STRING:
            push(token);
            break;
        case SYMBOL: {
            Variable *var = find(token);
            if (!var) error("Variable not bound: '%s'\n", token);

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
