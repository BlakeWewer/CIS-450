#include <stdio.h>
void f();
int g();

int x;

void main() {
	int z;
	x = 10;

	f();
	z = g();

	printf("answer = %d\n", z);
}
