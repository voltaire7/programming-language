#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.c"

char*  fileContent = NULL;
size_t contentSize = 0;
size_t position    = 0;

int temp = 0;

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

void eval() {
    for (;; position++) {
        while (isspace(fileContent[position])) {
            position++;
        }

        if (position >= contentSize) {
            exit(0);
        }

        int start = position;
        if (isdigit(fileContent[position])) {
            position++;
            while (isdigit((fileContent[position]))) position++;
            if (fileContent[position] == '.')
                while (isdigit(fileContent[++position])) position++;

            if (isspace(fileContent[position])
                || fileContent[position] == '\0') {
                temp = atoi_len(fileContent + start, position - start);

                printf("Number: ");
                printlen(fileContent + start, position - start);
            } else
                goto symbol;

        } else if (fileContent[position] == '[') {
            position++;
            int layer = 0;
            do {
                if (fileContent[position] == '[') layer++;
                if (fileContent[position] == ']') layer--;
                position++;
            } while (fileContent[position] != ']' || layer != 0);
            printf("Quote : ");
            printlen(fileContent + start, ++position - start);
        } else {
            position++;
        symbol:
            while (!isspace(fileContent[position])
                   && fileContent[position] != '0') {
                position++;
            }
            printf("Symbol: ");
            printlen(fileContent + start, position - start);
        }
        putchar('\n');
    }
}

int main(int argc, char** argv) {
    Dictionary* env = NULL;
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    readFileContent(argv[1]);
    eval();

    free(fileContent);
    return 0;
}
