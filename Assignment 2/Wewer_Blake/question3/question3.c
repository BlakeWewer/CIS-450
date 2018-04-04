#include <stdio.h>
#include <stdlib.h>

int i;
char c1;

int j = 3;
int m = 1;


int trace_me(int param1, int param2, char uc)
{
	static int p = 7;
	static int o = 1;
	int n = 3;
	m++;
	
	if(param1 == 0)
	{
		printf("\n%d\t%d\t%d\t%d\t%d\t%d\n", p, o, n, m, param2, param1);
	}else{
		o++;
		p++;
		param2++;
		c1++;
		trace_me(param1 - 1, param2, c1);
	}
	
	return 0;
}

int main()
{
	c1 = 2;
	
	trace_me(2, m, c1);
	
	return 0;
}
