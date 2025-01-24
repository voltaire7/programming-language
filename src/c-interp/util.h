#ifndef UTIL_H
#define UTIL_H

#include "shared.h"

void error(char *msg, ...);
Program read_file(char *filename);
bool is_number(Token token);
Type get_type(Token token);
void debug_stack();
Token get_token(Program *program);
char *pop();
void push(char *value);
Token unquote(Token token);

#endif
