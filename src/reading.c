#include <stdio.h>

#include "convert-str.c"

int repl() {
    char buffer[100]; // Buffer to store input

    printf("Enter some text: ");

    while (1) {
        if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
            unsigned int num = str_to_n(buffer);
            printf("num: %x\n", num);
        } else {
            printf("Error reading input.\n");
        }
    }

    return 0;
}
