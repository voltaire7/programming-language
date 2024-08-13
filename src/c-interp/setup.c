#include "env.h"
#include "procedures.h"

#define UPSERT(symbol, proc) upsert(env, symbol, (Value) proc, PROCEDURE)

Dictionary* env;

int   stack_arr[BUFSIZ];
void* stack = stack_arr;

void setup() {
    env = create_dictionary();
    upsert(env, "decrement-layer?", (Value) 0, NEITHER);

    UPSERT("print", PRINT);
    UPSERT("free", FREE);
    UPSERT("do", DO);
    UPSERT("do-here", DO_HERE);
    UPSERT("proc", PROC);
    UPSERT("item-in", ITEM_IN);
    UPSERT("iter", ITER);

    UPSERT("?", IF);

    UPSERT("+", ADD);
    UPSERT("-", SUB);
    UPSERT("*", MUL);
    UPSERT("/", DIV);
    UPSERT("%", MODULO);

    UPSERT("+f", ADD_FLOAT);
    UPSERT("-f", SUB_FLOAT);
    UPSERT("*f", MUL_FLOAT);
    UPSERT("/f", DIV_FLOAT);
    UPSERT("%f", MODULO_FLOAT);

    UPSERT("==", EQUAL);
    UPSERT("!=", NOT_EQUAL);
    UPSERT(">", GREATER);
    UPSERT("<", SMALLER);
    UPSERT(">=", GREATER_EQUAL);
    UPSERT("<=", SMALLER_EQUAL);
    UPSERT("||", OR);
    UPSERT("&&", AND);
    UPSERT("!", NOT);

    UPSERT("label", LABEL);
    UPSERT("goto", GOTO);

    UPSERT("delete", DELETE);
    UPSERT("scan-token", SCAN_TOKEN);
    UPSERT("copy-token", COPY_TOKEN);
    UPSERT("parse", PARSE);

    UPSERT("macro", MACRO);
    UPSERT("syscall", SYSCALL);

    UPSERT("get", GET);
    UPSERT("set", SET);

    UPSERT("&", BIT_AND);
    UPSERT("|", BIT_OR);
    UPSERT("^", BIT_XOR);
    UPSERT("~", BIT_NOT);
    UPSERT("<<", BIT_SHIFTL);
    UPSERT(">>", BIT_SHIFTR);

    UPSERT("exec", EXEC);
    UPSERT("debug-proc", DEBUG_PROC);
    UPSERT("reduce", REDUCE);
    UPSERT("push", PUSH);
    UPSERT("pop", POP);
    UPSERT("proc2", PROC2);

    UPSERT("movz", MOVZ);
    UPSERT("movk", MOVK);
    UPSERT("svc", SVC);
    UPSERT("ldr", LDR);
    UPSERT("movr", MOVR);
}
