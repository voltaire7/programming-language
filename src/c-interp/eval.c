#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "shared.h"
#include "util.h"
#include "eval.h"
#include "env.h"

extern int stack_index;

void args(Program *program, int count) {
    int goal = stack_index + count;
    while (stack_index < goal) {
        int sp = stack_index;
        eval(program, true);
        if (sp == stack_index) error("Operand returned nothing.");
    }
    reverse_stack(count - goal + stack_index);
}

bool next(Program *program) {
    int sp = stack_index;
    eval(program, false);
    if (sp == stack_index) return false;
    return true;
}

void eval(Program *program, bool should_continue) {
    if (!program) return;
    Token token = get_token(program);
    if (!token) {
        if (should_continue) eval(program->scope_static, true);
        return;
    }

    Type type = get_type(token);
    switch (type) {
        case NUMBER:
        case STRING:
            push(token);
            break;
        case SYMBOL: {
            Variable *var = find(program, token);
            if (!var) error("Variable not bound: '%s'", token);
            free(token);

            if (var->is_intrinsic) ((void (*)(Program *)) var->value)(program);
            else interpret(&(Program){ .code = var->value, .size = strlen(var->value), .dir = program->dir, .scope_static = var->program, .scope_dynamic = program });
        } break;
    }
}

void interpret(Program *program) {
    for (int i = 0; program->position < program->size; i++) {
        eval(program, false);
    }
    // free_env(program);
}
