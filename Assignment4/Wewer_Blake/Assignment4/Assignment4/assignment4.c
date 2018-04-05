#include <stdio.h>

int a[3][2][2][2] = {1,2,3,4,5,6,7,8,9,10,11,12,
   13,14,15,16,17,18, 19, 20, 21, 22, 23, 24};

// declare variables b~q

int (*b)[2][2][2] = a;
int *c[3][2][2] = { {	{ a[0][0][0], a[0][0][1] },
							{ a[0][1][0], a[0][1][1] }},
						{	{ a[1][0][0], a[1][0][1] },
							{ a[1][1][0], a[1][1][1] }},
						{	{ a[2][0][0], a[2][0][1] },
							{ a[2][1][0], a[2][1][1] }} };
int *(*d)[2][2] = c;
int **e[3][2] = { {c[0][0], c[0][1]} , { c[1][0], c[1][1] },{ c[2][0], c[2][1] } };
int **(*f)[2] = e;
int ***g[3] = { e[0], e[1], e[2] };
int ****h = g;
int *(*i[3])[2] = { c[0], c[1], c[2] };
int *(**j)[2] = i;
int (*k[3])[2][2] = { a[0], a[1], a[2] };
int (**m)[2][2] = k;
int (*n[3][2])[2] = { {a[0][0], a[0][1]},{ a[1][0], a[1][1] },{ a[2][0], a[2][1] } };
int(*(*o)[2])[2] = n;
int (**p[3])[2] = { n[0], n[1], n[2] };
int (***q)[2] = p;

void main() {
  int ii, jj, kk, mm;
  int dummy;

//  printf("a\tb\tc\td\te\tf\tg\th\ti\tj\tk\tm\tn\to\tp\tq\n");
  for(ii = 0; ii < 3; ii++)
   for(jj = 0; jj < 2; jj++)
    for(kk = 0; kk < 2; kk++)
     for(mm = 0; mm < 2; mm++) {
       printf("%d\t", a[ii][jj][kk][mm]); 
       printf("%d\t", b[ii][jj][kk][mm]); 
       printf("%d\t", c[ii][jj][kk][mm]); 
       printf("%d\t", d[ii][jj][kk][mm]); 
       printf("%d\t", e[ii][jj][kk][mm]); 
       printf("%d\t", f[ii][jj][kk][mm]); 
       printf("%d\t", g[ii][jj][kk][mm]); 
       printf("%d\t", h[ii][jj][kk][mm]); 
       printf("%d\t", i[ii][jj][kk][mm]); 
       printf("%d\t", j[ii][jj][kk][mm]); 
       printf("%d\t", k[ii][jj][kk][mm]); 
       printf("%d\t", m[ii][jj][kk][mm]); 
       printf("%d\t", n[ii][jj][kk][mm]); 
       printf("%d\t", o[ii][jj][kk][mm]); 
       printf("%d\t", p[ii][jj][kk][mm]); 
       printf("%d\t", q[ii][jj][kk][mm]); 
       printf("\n");
     }
  scanf_s("%d", &dummy);
}
