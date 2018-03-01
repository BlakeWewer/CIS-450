#include <stdio.h>

char *(*(*x[2][3])[4])();

char *(*y[2][4])();

char *f()
{
  return "We are K-State";
}

void main()
{
   x[0][2] = y;
   y[1][3] = f;
   printf("%s\n", (*x[0][2][1][3])());
}
