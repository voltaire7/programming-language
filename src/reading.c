#include <stdio.h>
#include <sys/_types/_size_t.h>

#include "convert-str.c"
#include "execute.c"

int repl() {
    char buffer[100];

    while (1) {
        if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
            size_t size;
            unsigned int* code = from_str(buffer, &size, 2, 'E');
            if (code != NULL) {
                execute(code, size);
            }
        } else {
            printf("Error reading input.\n");
        }
    }

    return 0;
}
