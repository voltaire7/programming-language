#include <string.h>

void reverseString(char *str) {
    char *start = str;
    char *end = str + strlen(str) - 1; // Point to the last character

    while (start < end) {
        // Swap characters pointed to by start and end
        char temp = *start;
        *start = *end;
        *end = temp;

        // Move pointers towards the center
        start++;
        end--;
    }
}
