#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "parse.h"
#include "procedures.h"
#include "util.h"

extern char* token;
extern long  size;

extern long start;
extern long end;

extern Dictionary* env;

extern TokenType token_type;

void eval() {
    Value val;
    switch (token_type) {
        case INTEGER:
            val.intValue = atoi(token + start);
            upsert(env, "_", val, false);
            break;
        case FLOAT:
            val.floatValue = atof(token + start);
            upsert(env, "_", val, false);
            break;
        case QUOTE:
            break;
        case SYMBOL: {
            char* s;
            symbolcpy(&s);
            Entry* entry = lookup(env, s);
            if (entry == NULL) error("Undefined symbol : '%s'", s);
            if (entry->is_procedure)
                entry->value.procedureValue();
            else {
                end = start;
                DO();
            }
            break;
        }
    }
}
