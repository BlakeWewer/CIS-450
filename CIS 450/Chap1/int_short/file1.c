#include <stdio.h>

void f();

short x;
short y;

void main() {
  x = 0X4321;
  y = 0x7654;
  printf("%x\t %x\n", x, y);

  f();
  printf("%x\t %x\n", x, y);
}

  
  


