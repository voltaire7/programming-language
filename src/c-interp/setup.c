#include "env.h"
#include "procedures.h"

Dictionary* env;

void setup() {
    env = create_dictionary();
    Value val;

    val.procedureValue = PRINT;
    upsert(env, "print", val, PROCEDURE);

    val.procedureValue = ITEM;
    upsert(env, "item", val, PROCEDURE);

    val.procedureValue = FREE;
    upsert(env, "free", val, PROCEDURE);

    val.procedureValue = DO;
    upsert(env, "do", val, PROCEDURE);

    val.procedureValue = PROC;
    upsert(env, "proc", val, PROCEDURE);

    val.procedureValue = ITEM_IN;
    upsert(env, "item-in", val, PROCEDURE);

    val.procedureValue = ITER;
    upsert(env, "iter", val, PROCEDURE);

    val.procedureValue = PARSE;
    upsert(env, "parse", val, PROCEDURE);

    val.procedureValue = COPY_TOKEN;
    upsert(env, "copy-token", val, PROCEDURE);
}
