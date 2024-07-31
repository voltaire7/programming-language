#include "env.h"
#include "procedures.h"

#define UPSERT(symbol, proc) upsert(env, symbol, (Value) proc, PROCEDURE);

Dictionary* env;

void setup() {
    env = create_dictionary();

    UPSERT("print", PRINT)
    UPSERT("free", FREE)
    UPSERT("do", DO)
    UPSERT("do-here", DO_HERE)
    UPSERT("proc", PROC)
    UPSERT("item-in", ITEM_IN)
    UPSERT("iter", ITER)
    UPSERT("scan-token", SCAN_TOKEN)
    UPSERT("copy-token", COPY_TOKEN)

    UPSERT("?", IF)

    UPSERT("+", ADD)
    UPSERT("-", SUB)
    UPSERT("*", MUL)
    UPSERT("/", DIV)

    UPSERT("+f", ADD_FLOAT)
    UPSERT("-f", SUB_FLOAT)
    UPSERT("*f", MUL_FLOAT)
    UPSERT("/f", DIV_FLOAT)

    UPSERT("==", EQUAL)
    UPSERT("!=", NOT_EQUAL)
    UPSERT(">", GREATER)
    UPSERT("<", SMALLER)
    UPSERT(">=", GREATER_EQUAL)
    UPSERT("<=", SMALLER_EQUAL)
    UPSERT("||", OR)
    UPSERT("&&", AND)
    UPSERT("!", NOT)

    UPSERT("label", LABEL)
    UPSERT("goto", GOTO)
    UPSERT("for", FOR)
    UPSERT("while", WHILE)
}
