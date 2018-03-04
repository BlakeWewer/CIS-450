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
		// c = [ebp+5]
		// s = [ebp+7]
		// uc = [ebp+8]
		// i = [ebp+12]
		sub esp, 4
		//Assign c+5 to gc, s + 10 to s1, uc + 5 to uc1, and i to gi
		mov eax, BYTE PTR[ebp+5]
		add eax, 5
		mov BYTE PTR gc, eax
		
		mov eax, WORD PTR[ebp+7]
		add eax, 10
		mov WORD PTR[esp+2], eax
		
		mov eax, BYTE PTR[ebp+8]
		add eax, 5
		mov BYTE PTR[esp+3], eax
		
		mov eax, DWORD PTR[ebp+12]
		mov DWORD PTR gi, eax
		
		//call f with gc, s1, uc1, gi in this order
		mov eax, DWORD PTR gi
		push eax
		mov eax, BYTE PTR[esp+3]
		push eax
		mov eax, WORD PTR[esp+2]
		push eax
		mov eax, BYTE PTR gc
		push eax
		call f
	
		//return the return value of invocation of f
		
		add esp, 4
		mov esp, ebp
	}
}

int f(int i1, int i2, int i3, int i4) {
	printf("i1 = %d\ti2 = %d\ti3 = %d\ti4 = %d\n", i1, i2, i3, i4);
	return i1*2 + i2 + i3 + i4;
}