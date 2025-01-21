#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "shared.h"

Environment env = {};

int hash(char *key) {
    int value = 0, key_len = strlen(key);
    for (int i = 0; i < key_len; ++i) {
        value = value * 37 + key[i];
    }
    return value % ENV_SIZE;
}

Variable *find(char *key) {
    int index = hash(key);
    Variable *var = env.var[index];
    while (var) {
        if (!strcmp(key, var->key)) return var;
        var = var->next;
    }
    return NULL;
}

void upsert(char *key, void *value, bool is_intrinsic) {
    int index = hash(key);
    Variable *var = env.var[index], *prev;

    if (!var) {
        env.var[index] = malloc(sizeof(Variable));
        env.var[index]->key = key;
        env.var[index]->value = value;
        env.var[index]->is_intrinsic = is_intrinsic;
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
