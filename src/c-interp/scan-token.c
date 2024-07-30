#include "scan-token.h"

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

extern long layer_offset;

void scan_token(
    char*      token,
    long*      start,
    long*      end,
    long       size,
    TokenType* token_type
) {
    while (isspace(token[*end])) {
        (*end)++;
    }

    if ((*end) >= size && env->next == NULL)
        exit(0);
    else if ((*end) >= size && env->next != NULL) {
        if (lookup(env, "decrement-layer?")->value.intValue) layer_offset--;
        pop_scope();
        recover_state();
        scan_token_default();
        return;
    }

    *start = *end;
    bool cond =
        (token[*end] == '.' || token[*end] == '-') && isdigit(token[*end + 1])
        || isdigit(token[*end]);
    if (cond) {
        *token_type = INTEGER;
        if (token[*end] != '.') (*end)++;
        while (isdigit((token[*end]))) (*end)++;

        if (token[*end] == '.') {
            while (isdigit(token[++(*end)]));
            *token_type = FLOAT;
        }

        if (!isspace(token[*end]) && token[*end] != '\0') goto symbol;
    } else if (token[*end] == '[') {
        *token_type = QUOTE;
        int layer   = 1;
        do {
            (*end)++;
            if (token[*end] == '\0')
                error("Non-terminating quote : '%s'", token + *start);
            if (token[*end] == '[' && token[*end - 1] != '\\')
                layer++;
            else if (token[*end] == ']' && token[*end - 1] != '\\')
                layer--;
        } while (token[*end] != ']' || layer != 0);
        (*end)++;
    } else {
    symbol:
        while (!isspace(token[*end]) && token[*end] != '\0') {
            (*end)++;
        }
        *token_type = SYMBOL;
    }
}

void scan_token_default() {
    scan_token(token, &start, &end, size, &token_type);
}
