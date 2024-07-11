#ifndef UTILS_H
#define UTILS_H

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void  error(char* msg, ...);
void  readFileContent(const char* filename);
void  printlen(char* str, const int len);
char* quotecpy();
char* symbolcpy();
void  process_str(char* s);
void  concat(char** dest, const char* src);

#endif
