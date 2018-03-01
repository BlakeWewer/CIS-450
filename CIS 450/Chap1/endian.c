//////////////////////////////////////////////////////////////////////////////
//    endian.c
//    written by M. Mizuno, 1990
//     modified for Learning Tree Course 223P, 2004
//      to explain Little and Big Endian Machines
/////////////////////////////////////////////////////////////////////////////
#include <stdio.h>

int x = 0x12345678;
int main() {
  char *cp = (char *) &x;
  printf("%x\t%x\t%x\t%x\n", *cp, *(cp+1), *(cp+2), *(cp+3));

  return 0;
}
