#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

#include "env.c"
#include "util.h"

extern char*  fileContent;
extern size_t contentSize;
extern size_t position;

double temp = 0;

void eval() {
    Dictionary* env = create_dictionary();
    Value       val;
    for (;; position++) {
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

            if (isspace(fileContent[position])
                || fileContent[position] == '\0') {
                val.floatValue = atof(fileContent + offset);
                upsert(env, "_", FLOAT_TYPE, val);
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
        } else {
            position++;
        symbol:
            while (!isspace(fileContent[position])
                   && fileContent[position] != '0') {
                position++;
            }
            printf("Symbol: ");
            printlen(fileContent + offset, position - offset);
        }
        putchar('\n');
    }
}
