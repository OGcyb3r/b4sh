#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

char *readFile(char *filename) {
    FILE *f = fopen(filename, "rt");
    assert(f);
    fseek(f, 0, SEEK_END);
    long length = ftell(f);
    fseek(f, 0, SEEK_SET);
    char *buffer = (char *) malloc(length + 1);
    buffer[length] = '\0';
    fread(buffer, 1, length, f);
    fclose(f);
    return buffer;
}

int main() {
    char fil[333];
    printf("type the path you wish to read now : ");
    scanf("%s", fil);
    char *content = readFile(fil);
    printf("%s", content);
}
