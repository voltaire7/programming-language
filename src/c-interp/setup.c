#include "env.h"
#include "procedures.h"

Dictionary* env;

void setup() {
    env = create_dictionary();

    upsert(env, "print", (Value) PRINT, PROCEDURE);
    upsert(env, "free", (Value) FREE, PROCEDURE);
    upsert(env, "do", (Value) DO, PROCEDURE);
    upsert(env, "proc", (Value) PROC, PROCEDURE);
    upsert(env, "item-in", (Value) ITEM_IN, PROCEDURE);
    upsert(env, "iter", (Value) ITER, PROCEDURE);
    upsert(env, "scan-token", (Value) SCAN_TOKEN, PROCEDURE);
    upsert(env, "copy-token", (Value) COPY_TOKEN, PROCEDURE);

    upsert(env, "?", (Value) IF, PROCEDURE);

    upsert(env, "+", (Value) ADD, PROCEDURE);
    upsert(env, "-", (Value) SUB, PROCEDURE);
    upsert(env, "*", (Value) MUL, PROCEDURE);
    upsert(env, "/", (Value) DIV, PROCEDURE);

    upsert(env, "+f", (Value) ADD_FLOAT, PROCEDURE);
    upsert(env, "-f", (Value) SUB_FLOAT, PROCEDURE);
    upsert(env, "*f", (Value) MUL_FLOAT, PROCEDURE);
    upsert(env, "/f", (Value) DIV_FLOAT, PROCEDURE);

    upsert(env, "==", (Value) EQUAL, PROCEDURE);
    upsert(env, "!=", (Value) NOT_EQUAL, PROCEDURE);
    upsert(env, ">", (Value) GREATER, PROCEDURE);
    upsert(env, "<", (Value) SMALLER, PROCEDURE);
    upsert(env, ">=", (Value) GREATER_EQUAL, PROCEDURE);
    upsert(env, "<=", (Value) SMALLER_EQUAL, PROCEDURE);
    upsert(env, "||", (Value) OR, PROCEDURE);
    upsert(env, "&&", (Value) AND, PROCEDURE);
    upsert(env, "!", (Value) NOT, PROCEDURE);
}
