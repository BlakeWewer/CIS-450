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
		// complete your assembly program here
		
		//Allocate local variables "short s1" and "unsigned char uc1"
		// c = [ebp+8]
		// s = [ebp+12]
		// uc = [ebp+16]
		// i = [ebp+20]
		sub esp, 4
		//Assign c+5 to gc, s + 10 to s1, uc + 5 to uc1, and i to gi
		movsx eax, DWORD PTR[ebp+8]
		add eax, 5
		mov DWORD PTR gc, eax
		
		movsx eax, DWORD PTR[ebp+12]
		add eax, 10
		mov DWORD PTR[esp-1], eax
		
		movzx eax, DWORD PTR[ebp+16]
		add eax, 5
		mov DWORD PTR[esp-3], eax
		
		mov eax, DWORD PTR[ebp+20]
		mov DWORD PTR gi, eax
		
		//call f with gc, s1, uc1, gi in this order
		mov eax, DWORD PTR gi
		push eax
		movzx eax, BYTE PTR[esp-3]
		push eax
		movsx eax, WORD PTR[esp-1]
		push eax
		movsx eax, BYTE PTR gc
		push eax
		call f
	
		//return the return value of invocation of f
		add esp, 8
		mov esp, ebp
	}
}

int f(int i1, int i2, int i3, int i4) {
	printf("i1 = %d\ti2 = %d\ti3 = %d\ti4 = %d\n", i1, i2, i3, i4);
	return i1*2 + i2 + i3 + i4;
}