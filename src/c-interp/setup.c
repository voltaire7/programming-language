#include "env.h"
#include "procedures.h"

Dictionary* env;

void setup() {
    env = create_dictionary();

    Value val;
    val.procedureValue = print;
    upsert(env, "print", INT_TYPE, val);
}
