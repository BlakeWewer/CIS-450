#include <stdio.h>

char gc;
int gi;

int g();
int f(int i1, int i2, int i3, int i4);

void main() {
	int mi = g(126, 23, 126, 3);
	printf("gc = %d\tgi = %d\tmi = %d\n", gc, gi, mi);
}

// int g(char c, short s, unsigned char uc, int i) {
int g() {
	_asm {
		// complete your assmbly program here
	}
}

int f(int i1, int i2, int i3, int i4) {
	printf("i1 = %d\ti2 = %d\ti3 = %d\ti4 = %d\n", i1, i2, i3, i4);
	return i1*2 + i2 + i3 + i4;
}