#ifndef UTILS_H
#define UTILS_H

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void readFileContent(const char* filename);
void printlen(char* str, const int len);
void eprintlen(char* str, const int len);
void quotecpy(char** dest);
void symbolcpy(char** dest);

#endif
