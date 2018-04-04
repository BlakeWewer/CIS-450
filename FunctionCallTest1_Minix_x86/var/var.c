/*////////////////////// var1.c /////////////////////*/
long test();

char ret;
int x=100;
static int si;
static int sj = 23;

int main(int argc, char **argv, char **envp) {
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
