#include <stdio.h>

#include "env.h"
#include "util.h"

extern char*  fileContent;
extern size_t contentSize;
extern size_t position;

extern Dictionary* env;

extern

    void
    PRINT() {
    // printf("%s\n", fileContent + position);
    Value val;
    while (isspace(fileContent[position])) {
        position++;
    }

    if (position >= contentSize) {
        exit(0);
    }

    int offset = position;
    if (isdigit(fileContent[position])) {
        position++;
        while (isdigit((fileContent[position]))) position++;
        if (fileContent[position] == '.')
            while (isdigit(fileContent[++position]))
                ;

        if (isspace(fileContent[position]) || fileContent[position] == '\0') {
            printlen(fileContent + offset, position - offset);
        } else
            goto symbol;

    } else if (fileContent[position] == '[') {
        position++;
        int layer = 0;
        do {
            if (fileContent[position] == '[') layer++;
            if (fileContent[position] == ']') layer--;
            position++;
        } while (fileContent[position] != ']' || layer != 0);
        printlen(fileContent + offset + 1, position - offset - 1);
    } else {
        position++;
    symbol:
        while (!isspace(fileContent[position]) && fileContent[position] != '0'
        ) {
            position++;
        }
        char* dest = malloc(position - offset);
        strncpy(dest, fileContent + offset, position - offset);
        dest[position - offset] = '\0';

        Entry* result = lookup(env, dest);
        if (result != NULL)
            if (result->type == INT_TYPE)
                printf("%d", result->value.intValue);
            else
                printf("%.2f", result->value.floatValue);
        else {
            fprintf(
                stderr,
                "[\033[1;31mERROR\033[0m] Undefined symbol: '%s'\n",
                dest
            );
            exit(1);
        }
    }
}
