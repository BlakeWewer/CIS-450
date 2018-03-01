#include <stdio.h>

void f(int x) {
  int ai = x * 3;
  static int si = 20;
//  static int si = x * 50;

  printf("ai = %d\tsi = %d\n", ai, si);
}

void main() {
  f(100);
}

