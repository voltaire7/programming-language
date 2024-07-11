#include <stdlib.h>

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
            char*  s     = symbolcpy();
            Entry* entry = lookup_or_error(env, s);
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
