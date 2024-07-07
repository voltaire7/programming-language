#include <ctype.h>
#include <stdio.h>

#include "env.h"

extern char*  token;
extern size_t size;

extern Dictionary* env;

extern size_t start;
extern size_t end;

typedef enum {
    INTEGER,
    FLOAT,
    QUOTE,
    SYMBOL,
} TokenType;

TokenType token_type;

void parse() {
    while (isspace(token[end])) {
        end++;
    }

    if (end >= size) {
        exit(0);
    }

    start = end;
    if (isdigit(token[end])) {
        token_type = INTEGER;
        end++;
        while (isdigit((token[end]))) end++;
        if (token[end] == '.') {
            while (isdigit(token[++end]))
                ;
            token_type = FLOAT;
        }
        if (!isspace(token[end]) && token[end] != '\0') goto symbol;
    } else if (token[end] == '[') {
        token_type = QUOTE;
        int layer  = 1;
        do {
            end++;
            if (token[end] == '[')
                layer++;
            else if (token[end] == ']')
                layer--;
        } while (token[end] != ']' || layer != 0);
        end++;
    } else {
        end++;
    symbol:
        while (!isspace(token[end]) && token[end] != '0') end++;
        token_type = SYMBOL;
    }
}
