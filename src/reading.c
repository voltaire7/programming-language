#include <stdio.h>
#include <sys/_types/_size_t.h>

#include "convert-str.c"
#include "execute.c"

int repl() {
    char buffer[100]; // Buffer to store input

    while (1) {
        if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
            size_t size;
            unsigned int* code = from_hex(buffer, &size);
            if (code != NULL) {
                execute(code, size);
            }
        } else {
            printf("Error reading input.\n");
        }
    }

    return 0;
}
