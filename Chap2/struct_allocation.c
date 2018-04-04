#include <stdio.h>

typedef struct
{
   char c1;
   int  i1;
   char c2;
   short s1;
   double d1;
   char c3;
   int i2;
}  A;

void main()
{
   printf("size of A is %d\n", sizeof(A));
}
   
