#ifndef UTILS_H
#define UTILS_H

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "scan-token.h"

void        error(char* msg, ...);
void        readFileContent(const char* filename);
void        printlen(char* str, const int len);
char*       quotecpy();
char*       symbolcpy();
void        process_str(char* s);
void        concat(char** dest, const char* src);
Dictionary* get_env(int layer);
TokenType   type_of(char* symbol);

long syscall(long x16, long x0, long x1, long x2, long x3, long x4, long x5);
char parse_char(char* c);

#endif
