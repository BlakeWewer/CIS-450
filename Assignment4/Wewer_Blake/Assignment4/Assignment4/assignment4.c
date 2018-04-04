#include <stdio.h>

int a[3][2][2][2] = {1,2,3,4,5,6,7,8,9,10,11,12,
   13,14,15,16,17,18, 19, 20, 21, 22, 23, 24};

// declare variables b~q


void main() {
  int ii, jj, kk, mm;
  int dummy;

  for(ii = 0; ii < 3; ii++)
   for(jj = 0; jj < 2; jj++)
    for(kk = 0; kk < 2; kk++)
     for(mm = 0; mm < 2; mm++) {
       printf("%d\t", a[ii][jj][kk][mm]); 
//       printf("%d\t", b[ii][jj][kk][mm]); 
//       printf("%d\t", c[ii][jj][kk][mm]); 
//       printf("%d\t", d[ii][jj][kk][mm]); 
//       printf("%d\t", e[ii][jj][kk][mm]); 
//       printf("%d\t", f[ii][jj][kk][mm]); 
//       printf("%d\t", g[ii][jj][kk][mm]); 
//       printf("%d\t", h[ii][jj][kk][mm]); 
//       printf("%d\t", i[ii][jj][kk][mm]); 
//       printf("%d\t", j[ii][jj][kk][mm]); 
//       printf("%d\t", k[ii][jj][kk][mm]); 
//       printf("%d\t", m[ii][jj][kk][mm]); 
//       printf("%d\t", n[ii][jj][kk][mm]); 
//       printf("%d\t", o[ii][jj][kk][mm]); 
//       printf("%d\t", p[ii][jj][kk][mm]); 
//       printf("%d\t", q[ii][jj][kk][mm]); 
       printf("\n");
     }
  scanf_s("%d", &dummy);
}
