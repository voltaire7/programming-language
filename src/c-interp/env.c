#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "shared.h"

unsigned hash(char *key) {
    unsigned value = 0, key_len = strlen(key);
    for (int i = 0; i < key_len; ++i) {
        value = value * 37 + key[i];
    }
    return value % ENV_SIZE;
}

Variable *find(Program *program, char *key) {
    unsigned int index = hash(key);
    while (program) {
        Variable *var = program->env[index];
        while (var) {
            if (!strcmp(key, var->key)) return var;
            var = var->next;
        }
        program = program->next;
    }
    return NULL;
}

void upsert(Program *program, char *key, void *value, bool is_intrinsic) {
    unsigned index = hash(key);
    Variable *var = program->env[index], *prev;

    if (!var) {
        program->env[index] = malloc(sizeof(Variable));
        program->env[index]->key = key;
        program->env[index]->value = value;
        program->env[index]->is_intrinsic = is_intrinsic;
    } else {
        while (var) {
            if (!strcmp(key, var->key)) {
                var->value = value;
                return;
            }
            prev = var;
            var = var->next;
        }
        var = malloc(sizeof(Variable));
        var->key = key;
        var->value = value;
        var->is_intrinsic = is_intrinsic;
        prev->next = var;
    }
}
