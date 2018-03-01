#include <libcmt.h>
#include <oldnames.h>

int i;
int y; 													
static int j = 30;

void trace_me2(char v, char w)
{
	y = y + 1;
	if(v > v)											
	{
		v = v - 1;
		trace_me1(v - 2, w - 1);
	}				//LN1@trace_me2
}

void trace_me1(int a, int b)
{
	static int k = 2;
	x = x + 1;												
	char n = a + b;
	if(a > 0)
	{
		i = i + 1;
		k = k * k;
		trace_me2(a - 1, b * 2);
		i = i - 1;
	}else{			//LN2@trace_me1
		printf("%d\t%d\t%d\t%d\t%d\n", i, j, n, k, a);
	}				//LN1@trace_me1
}

int main(int argc, char **argv, char **envp)
{									
	static short x;										
	trace_me1(3, 4);
	printf("%d\t%d\t%d\n", x, y, i);
	
	return 0;
}