/////////////////////////////////////////////////////////////////////////
//       C pointer example 3
//          Masaaki Mizuno (c) 2006
//           modified for Learning Tree Course 223P, 2006
//
////////////////////////////////////////////////////////////////////////
#include <stdio.h>
#include <stdlib.h>

// Declare b, c, d, e, f, g, and  h correctly
int (*b)[4][3];

int *(*d)[4];

// XXX Declare f and h correctly;

int main() {
  int i, j, k;
  char dummy;

  // allocate array a and initialize it
  b = (int (*)[4][3]) malloc(sizeof(int [3][4][3]));
  for(i = 0; i < 3; i++)
    for(j = 0; j < 4; j++)
      for(k = 0; k < 3; k++)
	b[i][j][k] = i*12 + j*3 + k + 1;

  // allocate array c and initialize it
  d = (int *(*)[4]) malloc(sizeof(int *[3][4]));
  for(i = 0; i < 3; i++)
    for(j = 0; j < 4; j++)
      d[i][j] = b[i][j];

  // allocate array e and initialize it and variable f
  //  XXX COMPLETE THE CODE
  int ***f = (int ***)malloc(sizeof(int **[3]));
  for (i = 0; i < 3; i++) f[i] = d[i];


  // allocate array g and initlize it and variable h
  //  XXX COMPLETE THE CODE
  int(**h)[3] = (int(**)[3])malloc(sizeof(int(*[3])[3]));
  for (i = 0; i < 3; i++) h[i] = b[i];

  printf("a\tb\tc\td\te\tf\tg\th\n\n");
  for(i = 0; i < 3; i++)
    for(j = 0; j < 4; j++)
      for(k = 0; k < 3; k++) {
 //       printf("%d\t", a[i][j][k]);
	printf("\t");
        printf("%d\t", b[i][j][k]);
//       printf("%d\t", c[i][j][k]);
	printf("\t");
        printf("%d\t", d[i][j][k]);
//        printf("%d\t", e[i][j][k]);
	printf("\t");
    printf("%d\t", f[i][j][k]);  // UNCOMMENT WHEN YOU ARE DONE
//        printf("%d\t", g[i][j][k]);
	printf("\t");
     printf("%d\t", h[i][j][k]); // UNCOMMENT WHEN YOU ARE DONE
        printf("\n");
      }
  scanf_s("%c", &dummy);
  return 0;
}
