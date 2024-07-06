#ifndef UTILS_H
#define UTILS_H

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void readFileContent(const char* filename);
void printlen(char* str, const int len);
int  atoi_len(const char* str, int length);

#endif // FILE_OPERATIONS_H
