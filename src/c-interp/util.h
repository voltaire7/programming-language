#ifndef UTIL_H
#define UTIL_H

#include "shared.h"

void error(char *, ...);
Program read_file(char *);
bool is_number(Token);
Type get_type(Token);
void debug_stack();
Token get_token(Program *);
char *pop();
void push(char *);
Token unquote(Token);
char *ftoa(double);
void reverse_stack(int);
int length(Token);

#endif
