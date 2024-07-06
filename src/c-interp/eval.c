#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "util.h"

char*  fileContent = NULL;
size_t contentSize = 0;
size_t position    = 0;

int temp = 0;

void eval() {
    for (;; position++) {
        while (isspace(fileContent[position])) {
            position++;
        }

        if (position >= contentSize) {
            exit(0);
        }

        int start = position;
        if (isdigit(fileContent[position])) {
            position++;
            while (isdigit((fileContent[position]))) position++;
            if (fileContent[position] == '.')
                while (isdigit(fileContent[++position])) position++;

            if (isspace(fileContent[position])
                || fileContent[position] == '\0') {
                temp = atoi_len(fileContent + start, position - start);

                printf("Number: ");
                printlen(fileContent + start, position - start);
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
            printf("Quote : ");
            printlen(fileContent + start, ++position - start);
        } else {
            position++;
        symbol:
            while (!isspace(fileContent[position])
                   && fileContent[position] != '0') {
                position++;
            }
            printf("Symbol: ");
            printlen(fileContent + start, position - start);
        }
        putchar('\n');
    }
}
