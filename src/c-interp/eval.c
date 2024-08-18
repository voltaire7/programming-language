#include <stdlib.h>
#include <sys/mman.h>

#include "defines.h"
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

extern void* stack;

void eval() {
    Value val;
    switch (token_type) {
        case INTEGER:
            val.longValue = atoi(token + start);
            upsert(get_env(0), "_", val, NEITHER);
            PUSH_T(long, val.longValue);
            break;
        case FLOAT:
            val.doubleValue = atof(token + start);
            upsert(get_env(0), "_", val, NEITHER);
            PUSH_T(double, val.doubleValue);
            break;
        case CHAR:
            upsert(get_env(0), "_", (Value) parse_char(token + start), NEITHER);
            PUSH_T(long, parse_char(token + start));
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
            } else if (entry->type == EXPERIMENTAL) {
                void* old = stack;
                entry->value.procedureValue();

                return;
                int size     = stack - old + sizeof(int);
                int (*ptr)() = mmap(
                    NULL,
                    size,
                    PROT_WRITE,
                    MAP_PRIVATE | MAP_ANONYMOUS,
                    -1,
                    0
                );
                if (ptr == MAP_FAILED) perror("mmap");

                memcpy(ptr, old, size);
                ((int*) ptr)[(size - 1) / sizeof(int)] = 0xd65f03c0;

                if (mprotect(ptr, size, PROT_EXEC) == -1) perror("mprotect");

                stack = old;
                ptr();
            } else
                error("Cannot evaluate symbol: '%s'", entry->key);
            break;
        }
    }
}
