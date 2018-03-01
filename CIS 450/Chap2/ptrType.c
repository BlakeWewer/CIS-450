///////////////////////////////////////////////////////////////////////////
//        C pointer test program 1
//             Masaaki Mizuno (c)  1992
//               modified for Learning Tree Course 223P, 2005
//                to explain pointer values and types
//////////////////////////////////////////////////////////////////////////
#include <stdio.h>

int a[3][4] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};

int main(){
  printf("%d\t%d\t%d\n", a, a[0], a[0][0]);
  printf("%d\t%d\t%d\n", a, *a, **a);
  printf("%d\t%d\t%d\n", a+1, a[0]+1, a[0][0]+1);

  return 0;
}
