#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "parse.h"

extern char*  token;
extern size_t size;

extern size_t start;
extern size_t end;

extern Dictionary* env;

extern TokenType token_type;

void eval() {
    Value val;
    for (;; end++) {
        parse();

        switch (token_type) {
            case INTEGER:
                val.intValue = atoi(token + start);
                upsert(env, "_", INT_TYPE, val);
                break;
            case FLOAT:
                val.floatValue = atof(token + start);
                upsert(env, "_", FLOAT_TYPE, val);
                break;
            case QUOTE:
                break;
            case SYMBOL: {
                char* dest = malloc(end - start + 1);
                strncpy(dest, token + start, end - start);
                dest[end - start] = '\0';

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
                break;
            }
            default:
                exit(1);
        }
    }
}
