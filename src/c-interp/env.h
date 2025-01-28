#ifndef ENV_H
#define ENV_H

#include "shared.h"

unsigned hash(char *key);
Variable *find(Program *program, char *key);
void upsert(Program *program, char *key, void *value, bool is_intrinsic);

#endif
