////////////////////////////////////////////////////////////////////////////
//      var.c program to test memory allocation in C
//         M. Mizuno (c) 1995, 2004, 2005
//          modified for Learning Tree course 223P
//
// to compile var.c on Pentium,
// 1. execute Visual Studio .NET2003 (~2017) x86 Native Tools Command Prompt
// 2. go to the directory which contains var.c
// 3. issue cl /Od /FAcs var.c
//        /Od: disable optimization
//        /FAcs: generate a listing file with source code and machine code
///////////////////////////////////////////////////////////////////////////
long test(unsigned int ui, int i, short s, unsigned short us,
	char c, unsigned char uc, long l, unsigned long ul,
	int x, short y);

char ret;
int x=100;
static int si;
static int sj = 23;

int main(int argc, char **argv, char **envp)
{
	unsigned char uc;
	static short y = 99;
	short s;
	char c;
	unsigned short us;
	static int i;
	unsigned int ui;
	long l;
	unsigned long ul;

	if (i < 0) {
		ui = us + s - c;
	}
	else {
		ul = si - sj * 2;
	}

	while (sj > 0) {
		uc = y - 3;
		sj++;
	}

	ret = test(ui, i, s, us, c, uc, l, ul, x,  y);

	return 0;
}

long test(unsigned int ui, int i, short s, unsigned short us,
	char c, unsigned char uc, long l, unsigned long ul,
	int x, short y)
{
	char c1;
	int i1;
	char c2;

	ui = 1;
 	i = 2;
	s = 3;
	us = 4;
	c = 5;
	uc = 6;
	l = 7;
	ul = 8;
	x = 9;
	y = 10;
	c1 = 11;
	c2 = 12;
	i1 = 13;
	return ui * 2 + l;
}
