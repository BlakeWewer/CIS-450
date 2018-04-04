//////////////////////////////////////////////////////////////////////////////
//    IntegralPromotion.c
//      written by M. Mizuno, 1990
//      modified for Learning Tree Course 223P, 2004
//       to explain Integral Promotion
/////////////////////////////////////////////////////////////////////////////
#include <stdio.h>

int main() {
  char c;
  unsigned char uc;
  short s1, s2;
  unsigned short us1, us2;

  c = 0xf0; uc = 0xf0;
  us1 = c; us2 = uc;
  printf("us1 = %8x,\tus2 = %8x\n", us1, us2);
  s1 = c; s2 = uc;
  printf("us1 = %8x,\tus2 = %8x\n", s1, s2);

  return 0;
}
