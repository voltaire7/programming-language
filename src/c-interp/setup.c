#include "env.h"
#include "procedures.h"

Dictionary* env;

void setup() {
    env = create_dictionary();

    Value val;
    val.procedureValue = PRINT;
    upsert(env, "print", PROCEDURE_TYPE, val);
}
