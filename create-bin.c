#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

#define BUFSZ 8

int main(int argc, char **argv) {
    unsigned char buf[BUFSZ] = {0};
    size_t bytes = 0, i, readsz = sizeof buf;
    if (argc != 2) {
        fprintf(stderr, "Usage: <source_file.c>\n");
        return 1;
    }

    FILE *fp_in = fopen(argv[1], "r");
    FILE *fp_out = fopen("output_file", "w");

    if (!fp_in) {
        fprintf(stderr, "error: file open failed '%s'.\n", argv[1]);
        return 1;
    }

    /* read/output BUFSZ bytes at a time */
    while ((bytes = fread(buf, sizeof *buf, readsz, fp_in)) == readsz) {
        fwrite(buf, sizeof *buf, readsz, fp_out); // Write buffer contents to file
    }

    if (fp_in != stdin)
        fclose(fp_in);

    fclose(fp_out); // Close the file

    // Change file permissions to make it executable
    if (chmod("output_file", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) != 0) {
        perror("chmod");
        return 1;
    }

    return 0;
}
