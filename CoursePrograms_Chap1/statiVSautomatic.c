#include <stdio.h>

void f() {
  int ai = 8;
  static int si = 100;
 
  printf("ai = %d\tsi = %d\n", ai, si);

  ai = 16;
  si = 200;
}

void main() {
  f();
  f();
}
