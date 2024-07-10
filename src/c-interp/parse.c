#include "parse.h"

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "util.h"

extern char* token;
extern long  size;

extern Dictionary* env;

extern long start;
extern long end;

TokenType token_type;

int test = 0;

void parse() {
parse:
    while (isspace(token[end])) {
        end++;
    }

    if (end >= size && env->next == NULL)
        exit(0);
    else if (end >= size && env->next != NULL) {
        pop_scope();
        goto parse;
    }

    start = end;
    if (token[end] == '-' || isdigit(token[end])) {
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
            if (token[end] == '\0')
                error("Non-terminating quote : '%s'", token + start);
            if (token[end] == '[' && token[end - 1] != '\\')
                layer++;
            else if (token[end] == ']' && token[end - 1] != '\\')
                layer--;
        } while (token[end] != ']' || layer != 0);
        end++;
    } else {
    symbol:
        while (!isspace(token[end]) && token[end] != '\0') {
            end++;
        }
        token_type = SYMBOL;
    }
}
