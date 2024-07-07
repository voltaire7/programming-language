#include "env.h"
#include "procedures.h"

Dictionary* env;

void setup() {
    env = create_dictionary();
    Value val;

    val.procedureValue = PRINT;
    upsert(env, "print", PROCEDURE_TYPE, val);

    val.procedureValue = PRINTF;
    upsert(env, "printf", PROCEDURE_TYPE, val);

    val.procedureValue = ITEM;
    upsert(env, "item", PROCEDURE_TYPE, val);

    val.stringValue = "Hello, World!\n";
    upsert(env, "hello", STRING_TYPE, val);
}
