#include <stdio.h>

int g(int g1, int g2);
int f(int x, int y);

int gg = 10;

void main() {
	int x, y, z;

	x = 34;
	y = 23;

	z = g(x, y);

	printf("z = %d\tgg = %d\n", z, gg);
}

int g(int g1, int g2) {
	int x, y;
	__asm {
		// x = g1;
		mov  eax, g1
		mov  x, eax
		// y = g2;
		mov  ecx, g2
		mov  y, ecx
		// gg = gg + x + y;
		mov  eax, gg
		add  eax, x
		add  eax, y
		mov  gg, eax
		// f(x, y, gg);
		push gg
		push y
		push x
		call f
		add  esp, 12

	}
}


int f(int x, int y, int z) {
	return x + y + z;
}