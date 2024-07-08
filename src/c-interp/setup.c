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
}
