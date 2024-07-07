#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"

extern char*  fileContent;
extern size_t contentSize;
extern size_t position;

extern Dictionary* env;

void eval() {
    Value val;
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
            ValueType type = INT_TYPE;
            while (isdigit((fileContent[position]))) position++;
            if (fileContent[position] == '.') {
                while (isdigit(fileContent[++position]))
                    ;
                type = FLOAT_TYPE;
            }

            if (isspace(fileContent[position])
                || fileContent[position] == '\0') {
                switch (type) {
                    case INT_TYPE:
                        val.intValue = atoi(fileContent + offset);
                        break;
                    case FLOAT_TYPE:
                        val.floatValue = atof(fileContent + offset);
                        break;
                    default:
                        exit(1);
                }
                upsert(env, "_", type, val);
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
            char* dest = malloc(position - offset);
            strncpy(dest, fileContent + offset, position - offset);
            dest[position - offset] = '\0';

            Entry* result = lookup(env, dest);
            if (result != NULL)
                result->value.procedureValue();
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
}
