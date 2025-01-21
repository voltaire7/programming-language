#ifndef ENV_H
#define ENV_H

#include "shared.h"

unsigned hash(char *key);
Variable *find(char *key);
void upsert(char *key, void *value, bool is_intrinsic);

#endif
