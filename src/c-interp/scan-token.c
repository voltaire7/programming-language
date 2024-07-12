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

int test = 0;

void scan_token(
    char*      inner_token,
    long*      inner_start,
    long*      inner_end,
    long       inner_size,
    TokenType* inner_token_type
) {
    while (isspace(inner_token[*inner_end])) {
        (*inner_end)++;
    }

    // printf("token: %s\n", token + *start);
    if ((*inner_end) >= inner_size && env->next == NULL)
        exit(0);
    else if ((*inner_end) >= inner_size && env->next != NULL) {
        pop_scope();
        scan_token(token, &start, &end, size, &token_type);
        return;
    }

    *inner_start = *inner_end;
    if (inner_token[*inner_end] == '-' || isdigit(inner_token[*inner_end])) {
        *inner_token_type = INTEGER;
        (*inner_end)++;
        while (isdigit((inner_token[*inner_end]))) (*inner_end)++;
        if (inner_token[*inner_end] == '.') {
            while (isdigit(inner_token[++(*inner_end)]))
                ;
            *inner_token_type = FLOAT;
        }
        if (!isspace(inner_token[*inner_end])
            && inner_token[*inner_end] != '\0')
            goto symbol;
    } else if (inner_token[*inner_end] == '[') {
        *inner_token_type = QUOTE;
        int layer         = 1;
        do {
            (*inner_end)++;
            if (inner_token[*inner_end] == '\0')
                error(
                    "Non-terminating quote : '%s'",
                    inner_token + *inner_start
                );
            if (inner_token[*inner_end] == '['
                && inner_token[*inner_end - 1] != '\\')
                layer++;
            else if (inner_token[*inner_end] == ']' && inner_token[*inner_end - 1] != '\\')
                layer--;
        } while (inner_token[*inner_end] != ']' || layer != 0);
        (*inner_end)++;
    } else {
    symbol:
        while (!isspace(inner_token[*inner_end])
               && inner_token[*inner_end] != '\0') {
            (*inner_end)++;
        }
        *inner_token_type = SYMBOL;
    }
}
