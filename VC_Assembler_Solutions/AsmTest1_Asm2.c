#include <stdio.h>

int g();
int f(int x, int y);

int gg = 10;

void main() {
	int x, y, z;

	x = 34;
	y = 23;

	z = g(x, y);

	printf("z = %d\tgg = %d\n", z, gg);
}

//int g(int g1, int g2) {
int g() {
	__asm {
		// allocate x and y, x is at [ebp-4], y is at [ebp-8]
		//  g1 is at [ebp+8], g2 is at [ebp+12]
		sub   esp, 8
		// x = g1;
		mov   eax, DWORD PTR[ebp + 8]
		mov   DWORD PTR[ebp - 4], eax
		// y = g2;
		mov   eax, DWORD PTR[ebp + 12]
		mov   DWORD PTR[ebp - 8], eax
		// gg = gg + x + y;
		mov   eax, DWORD PTR gg
		add   eax, DWORD PTR[ebp - 4]
		add   eax, DWORD PTR[ebp - 8]
		mov   DWORD PTR gg, eax
		// f(x, y, gg);
		push  DWORD PTR gg
		push  DWORD PTR [ebp - 8]
		push  DWORD PTR [ebp - 4]
		call f
		// return value of f (in eax) is the return value of this function
		// (so eax is already set)
		add   esp, 12
		// deallocate local variable area
		mov   esp, ebp

	}
}


int f(int x, int y, int z) {
	return x + y + z;
}