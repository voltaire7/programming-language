#include <stdlib.h>

#include "env.h"
#include "procedures.h"
#include "scan-token.h"
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
            val.longValue = atoi(token + start);
            upsert(get_env(0), "_", val, NEITHER);
            break;
        case FLOAT:
            val.doubleValue = atof(token + start);
            upsert(get_env(0), "_", val, NEITHER);
            break;
        case CHAR:
            upsert(get_env(0), "_", (Value) parse_char(token + start), NEITHER);
            break;
        case QUOTE:
            break;
        case SYMBOL: {
            char*  temp  = symbolcpy();
            Entry* entry = lookup_or_error(env, temp);
            free(temp);
            if (entry->type == PROCEDURE)
                entry->value.procedureValue();
            else if (entry->type == STRING) {
                end = start;
                DO();
            } else
                error("Cannot evaluate symbol: '%s'", entry->key);
            break;
        }
    }
}
