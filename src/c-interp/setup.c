#include "env.h"
#include "procedures.h"

Dictionary* env;

void setup() {
    env = create_dictionary();

    upsert(env, "print", (Value) PRINT, true);
    upsert(env, "free", (Value) FREE, true);
    upsert(env, "do", (Value) DO, true);
    upsert(env, "proc", (Value) PROC, true);
    upsert(env, "item-in", (Value) ITEM_IN, true);
    upsert(env, "iter", (Value) ITER, true);
    upsert(env, "scan-token", (Value) SCAN_TOKEN, true);
    upsert(env, "copy-token", (Value) COPY_TOKEN, true);
    upsert(env, "?", (Value) IF, true);
}
