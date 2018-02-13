#include <stdio.h>

int x = 2;
static int y;

int f(int p1, int p2) {
	int i1;
	short s1;
	unsigned short s2;

	i1 = p1 + p2;
	s1 = i1 + p1;
	s2 = i1 + p2;
	x--;
	if (x > 0) y = f(s1, s2);
	return i1 + s1 + s2 + y;
}

int main(int argc, char **argv, char **envp) {
	int m1;
	short s1;

	m1 = argc;
	s1 = 34;
	f(m1, s1);

	return 0;
}


