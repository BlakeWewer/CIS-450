#include <stdio.h>

int main(int argc, char **argv, char **envp)
{
   int i;
   int j;
   char ch;

   for(i = 0; i < argc; i++)
     printf("%s\n", argv[i]);

   i = 0;
   while (envp[i] != NULL)
   {
     j = 0;
     while ((ch = envp[i][j]) != NULL) 
     {
        printf("%c", ch);
        j++;
     }
     printf("\n");
     i++;
   }
}

