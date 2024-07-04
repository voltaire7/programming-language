#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* fileContent = NULL;
size_t contentSize = 0;
size_t position = 0;

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

void printlen(char* str, const int offset, const int len) {
    for (int i = offset; i != len; i++) putchar(str[i]);
    putchar('\n');
}

void eval() {
    for (;; position++) {
        while (isspace(fileContent[position])) {
            position++;
        }

        if (position >= contentSize) {
            exit(0);
        }

        if (isdigit(fileContent[position])) {
            int start = position++;
            while (isdigit((fileContent[position]))) position++;
            if (fileContent[position] == '.')
                while (isdigit(fileContent[++position])) position++;

            if (isspace(fileContent[position])
                || fileContent[position] == '\0') {
                printf("Number: ");
                printlen(fileContent, start, position);
            } else {
                while (!isspace(fileContent[position])
                       && fileContent[position] != '\0') {
                    position++;
                }
                printf("Symbol: ");
                printlen(fileContent, start, position);
            }
        } else if (fileContent[position] == '[') {
            int start = position++;
            int layer = 0;
            do {
                if (fileContent[position] == '[') layer++;
                if (fileContent[position] == ']') layer--;
                position++;
            } while (fileContent[position] != ']' || layer != 0);
            printf("Quote: ");
            printlen(fileContent, start, ++position);
        } else {
            int start = position++;
            while (!isspace(fileContent[position])
                   && fileContent[position] != '0') {
                position++;
            }
            printf("Symbol: ");
            printlen(fileContent, start, position);
        }
    }
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    readFileContent(argv[1]);
    eval();

    free(fileContent);
    return 0;
}
