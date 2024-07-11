#ifndef UTILS_H
#define UTILS_H

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void  error(char* msg, ...);
void  readFileContent(const char* filename);
void  printlen(char* str, const int len);
void  quotecpy(char** dest);
void  symbolcpy(char** dest);
void  process_str(char* s);
char* concat(char* dest, char* src);

#endif
