#include <stdio.h>

typedef struct u4 {
    unsigned int value : 4;
} u4;

int main() {
    // Array of u4, each element representing 4 bits
    u4 fourBitArray[4];
    int i;

    // Assign values to each element of the array
    for (i = 0; i < 4; i++) {
        fourBitArray[i].value = i; // Assigning values from 0 to 3
    }
    fourBitArray[3].value = 1;

    // Print the values stored in each element of the array
    printf("Values in the FourBit array:\n");
    for (i = 0; i < 4; i++) {
        printf("%d ", fourBitArray[i].value);
    }
    printf("\n");

    return 0;
}
