//////////////////////////////////////////////////////////////////////////////
//   wrongptr.c
//      written by M. Mizuno, 1992
//      modified for Learning Tree Course 223P, 2005
//       to demonstrate wrong pointer arithmetic
/////////////////////////////////////////////////////////////////////////////
#include <stdio.h>
int a[3][4] = {1,2,3,4,5,6,7,8,9,10,11,12};
int (*ap)[4] = a;

int main(int argc, char **argv, char **envp) {
  printf("%d\n", ap);
  printf("%d\n", ap+1);
  printf("%d\n", ap[1]);
  printf("%d\n", ap[1]+2);
  printf("%d\n", ap[1][2]);
}
