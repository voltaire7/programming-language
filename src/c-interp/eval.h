#ifndef EVAL_H
#define EVAL_H

#include "shared.h"

void args(Program *program, int count);
bool next(Program *program);
void eval(Program *program, bool should_continue);
void interpret(Program *program);

#endif
