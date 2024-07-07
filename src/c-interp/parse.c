#include <ctype.h>

#include "env.h"

typedef enum {
    NUMBER,
    QUOTE,
    SYMBOL,
} TokenType;

extern char*  fileContent;
extern size_t contentSize;
extern size_t token_end;

extern Dictionary* env;

int token_start = 0;

void parse() {
    Value val;
    while (isspace(fileContent[token_end])) {
        token_end++;
    }

    if (token_end >= contentSize) {
        exit(0);
    }

    int offset = token_end;
    if (isdigit(fileContent[token_end])) {
        token_end++;
        ValueType type = INT_TYPE;
        while (isdigit((fileContent[token_end]))) token_end++;
        if (fileContent[token_end] == '.') {
            while (isdigit(fileContent[++token_end]))
                ;
            type = FLOAT_TYPE;
        }

        if (isspace(fileContent[token_end]) || fileContent[token_end] == '\0') {
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

    } else if (fileContent[token_end] == '[') {
        token_end++;
        int layer = 0;
        do {
            if (fileContent[token_end] == '[') layer++;
            if (fileContent[token_end] == ']') layer--;
            token_end++;
        } while (fileContent[token_end] != ']' || layer != 0);
    } else {
        token_end++;
    symbol:
        while (!isspace(fileContent[token_end]) && fileContent[token_end] != '0'
        ) {
            token_end++;
        }
        char* dest = malloc(token_end - offset);
        strncpy(dest, fileContent + offset, token_end - offset);
        dest[token_end - offset] = '\0';

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
