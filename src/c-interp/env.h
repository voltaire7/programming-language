#ifndef ENV_H
#define ENV_H

#include "shared.h"

unsigned hash(char *);
Variable *find(Program *, char *);
Variable *find_here(Program *, char *);
void upsert(Program *, char *, void *, bool);
void delete(Program *, char *);
void free_env(Program *);

#endif
