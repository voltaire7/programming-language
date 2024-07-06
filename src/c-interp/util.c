#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char*  fileContent;
extern size_t contentSize;
extern size_t position;

void readFileContent(const char* filename) {
    FILE* filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        printf("Failed to open the file.\n");
        exit(1);
    }

    fseek(filePointer, 0, SEEK_END);
    contentSize = ftell(filePointer);
    fseek(filePointer, 0, SEEK_SET);

    fileContent = malloc(contentSize + 1);
    if (fileContent == NULL) {
        printf("Failed to allocate memory.\n");
        fclose(filePointer);
        exit(1);
    }

    fread(fileContent, 1, contentSize, filePointer);
    fileContent[contentSize] = '\0';

    fclose(filePointer);
}

void printlen(char* str, const int len) {
    for (char* max = str + len; str != max; str++) putchar(*str);
}

int atoi_len(const char* str, int length) {
    int result = 0;
    int sign   = 1;
    int i      = 0;

    // Skip leading whitespace
    while (isspace(str[i]) && i < length) {
        i++;
    }

    // Check for optional sign
    if (i < length && (str[i] == '-' || str[i] == '+')) {
        if (str[i] == '-') {
            sign = -1;
        }
        i++;
    }

    // Convert characters to integer
    while (i < length && isdigit(str[i])) {
        result = result * 10 + (str[i] - '0');
        i++;
    }

    return sign * result;
}
