//////////////////////////////////////////////////////////////////////////////
//    swap.c
//      written by M. Mizuno, 1992
//      modified for Learning Tree Course 223P, 2004
//       to explain pointer operations
/////////////////////////////////////////////////////////////////////////////
#include <stdio.h>

void swap(int x, int y) {
  int temp;
  temp = x;
  x = y;
  y = temp;
}

int main() {
  int a = 2;
  int b = 100;
  swap(a, b);
  printf("a = %d\tb = %d\n", a, b);
  return 0;
}
