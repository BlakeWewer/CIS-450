#include <stdio.h>

void main(void)
{
   int *pi = (int *) 100;
   char *pc = (char *) 100;

 
   printf("%d\t%d\n", pi, pc);
   printf("%d\t%d\n", pi+1, pc+1);
}
