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
}
