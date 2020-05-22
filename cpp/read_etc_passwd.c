#include <pwd.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
void uploads()
{
	FILE *open = fopen("/etc/passwd", "r");
	int upload;
	do {
		upload = fgetc (open);
		printf("%c", upload);
	}
	while (upload != EOF);
	fclose(open);
	printf("\n");
}
 
int main()
{
	uploads(); 
}
