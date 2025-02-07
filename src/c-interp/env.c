#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "shared.h"
#include "util.h"

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
        program = program->scope_static;
    }
    return NULL;
}

Variable *find_here(Program *program, char *key) {
    unsigned int index = hash(key);
    Variable *var = program->env[index];
    while (var) {
        if (!strcmp(key, var->key)) return var;
        var = var->next;
    }
    return NULL;
}

void upsert(Program *program, char *key, void *value, bool is_intrinsic) {
    unsigned index = hash(key);
    Variable *var = program->env[index], *prev;

    if (!var) {
        program->env[index] = malloc(sizeof(Variable));
        program->env[index]->key = strdup(key);
        program->env[index]->value = value;
        program->env[index]->is_intrinsic = is_intrinsic;
        program->env[index]->program = program;
    } else {
        while (var) {
            if (!strcmp(key, var->key)) {
                if (!var->is_intrinsic) free(var->value);
                var->value = value;
                var->is_intrinsic = is_intrinsic;
                return;
            }
            prev = var;
            var = var->next;
        }
        var = malloc(sizeof(Variable));
        var->key = strdup(key);
        var->value = value;
        var->is_intrinsic = is_intrinsic;
        var->program = program;
        prev->next = var;
    }
}

void delete(Program *program, char *key) {
    unsigned index = hash(key);
    Variable *var  = program->env[index], *prev = NULL;

    while (var != NULL) {
        if (strcmp(var->key, key) == 0) {
            if (prev == NULL) program->env[index] = var->next;
            else prev->next = var->next;
            free(var->key);
            if (!var->is_intrinsic) free(var->value);
            free(var);
            return;
        }
        prev  = var;
        var = var->next;
    }
    error("Cannot delete, variable not found: '%s'", key);
}

void free_env(Program program) {
    for (int i = 0; i < ENV_SIZE; i++) {
        Variable *var = program.env[i];
        while (var != NULL) {
            Variable *temp = var;
            var = var->next;
            free(temp->key);
            if (!temp->is_intrinsic) free(temp->value);
            free(temp);
        }
    }
}
