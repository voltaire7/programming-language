#ifndef FROM_STR_H
#define FROM_STR_H

#include <sys/_types/_size_t.h>

unsigned int* from_str(char* str, size_t* size, int base, char endian);

#endif
