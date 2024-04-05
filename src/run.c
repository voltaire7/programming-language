#include <stdio.h>

#include "execute.h"
#include "from_str.h"

void run_file(char file_name[]) {
    FILE* filePointer;
    char buffer[100];

    filePointer = fopen(file_name, "r");

    if (filePointer == NULL) {
        printf("Failed to open the file.\n");
        return;
    }

    while (fgets(buffer, sizeof(buffer), filePointer) != NULL) {
        size_t size;
        unsigned int* code = from_str(buffer, &size, 2, 'E');
        if (code != NULL) {
            execute(code, size);
        }
    }

    // Close the file
    fclose(filePointer);
}
