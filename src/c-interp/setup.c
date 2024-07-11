#include "env.h"
#include "procedures.h"

Dictionary* env;

void setup() {
    env = create_dictionary();
    Value val;

    val.procedureValue = PRINT;
    upsert(env, "print", val, true);

    val.procedureValue = FREE;
    upsert(env, "free", val, true);

    val.procedureValue = DO;
    upsert(env, "do", val, true);

    val.procedureValue = PROC;
    upsert(env, "proc", val, true);

    val.procedureValue = ITEM_IN;
    upsert(env, "item-in", val, true);

    val.procedureValue = ITER;
    upsert(env, "iter", val, true);

    val.procedureValue = PARSE;
    upsert(env, "parse", val, true);

    val.procedureValue = COPY_TOKEN;
    upsert(env, "copy-token", val, true);
}
