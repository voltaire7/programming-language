#include "eval.c"
#include "scan-token.h"
#include "setup.c"
#include "util.h"

int main(int argc, char** argv) {
    if (argc < 2) error("Usage: %s <filename>\n", argv[0]);

    readFileContent(argv[1]);
    setup();
    for (;;) {
        scan_token_default();
        eval();
    }

    return 0;
}
