#include "env.h"
#include "procedures.h"

Dictionary* env;

void setup() {
    env = create_dictionary();
    Value val;

    val.procedureValue = PRINT;
    upsert(env, "print", val);

    val.procedureValue = ITEM;
    upsert(env, "item", val);

    val.procedureValue = FREE;
    upsert(env, "free", val);

    val.procedureValue = DO;
    upsert(env, "do", val);

    val.procedureValue = PROC;
    upsert(env, "proc", val);

    val.procedureValue = ITEM_IN;
    upsert(env, "item-in", val);

    val.procedureValue = ITER;
    upsert(env, "iter", val);

    val.procedureValue = PARSE;
    upsert(env, "parse", val);

    val.procedureValue = COPY_TOKEN;
    upsert(env, "copy-token", val);
}
