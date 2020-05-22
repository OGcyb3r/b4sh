#include <stdio.h>
#include <stdlib.h>


void clearscreen(){
    #if defined(__linux__) || defined(__unix__) || defined(__APPLE__)
        system("clear");
    #endif

    #if defined(_WIN32) || defined(_WIN64)
        system("cls");
    #endif
}
int main()
{
    char ch;
    clearscreen();
    FILE *fpr, *fpw;
    char name[512];
    printf("#Copy A file contents to B file contents \n#Coded by MANds8\n");
    printf("Enter A file : ");
	scanf("%s", name);
    fpr = fopen(name, "r");
    
    if (fpr == NULL)
    {
		clearscreen();
		perror("error");
		exit(EXIT_FAILURE);
    }

    char secondFile[512];

    printf("Enter B file: ");
	scanf("%s", secondFile);
    fpw= fopen(secondFile, "w");

    
    if (fpw == NULL)
    {
       puts("B file cannot be opened");
    }

    
    while(1)
    {
        ch = fgetc(fpr);
        if (ch==EOF)
            break;
        else
            fputc(ch, fpw);
    }
 
	printf("| Your A contents file has been injected into [B] |\n");
 

    fclose(fpr);
    fclose(fpw);

    return 0;
}
