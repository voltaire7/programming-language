#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "parse.h"
#include "util.h"

extern char*  token;
extern size_t size;

extern long start;
extern long end;

extern Dictionary* env;

extern TokenType token_type;

void eval() {
    Value val;
    for (;; end++) {
        parse();

        switch (token_type) {
            case INTEGER:
                val.intValue = atoi(token + start);
                upsert(env, "_", val);
                break;
            case FLOAT:
                val.floatValue = atof(token + start);
                upsert(env, "_", val);
                break;
            case QUOTE:
                break;
            case SYMBOL: {
                char* dest;
                symbolcpy(&dest);
                Entry* result = lookup(env, dest);
                if (result == NULL) error("Undefined symbol : '%s'", dest);
                result->value.procedureValue();
                break;
            }
        }
    }
}
