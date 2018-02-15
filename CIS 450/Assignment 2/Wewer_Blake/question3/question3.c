#include <stdio.h>

int i = malloc(sizeof(int));
char *c1 = malloc(sizeof(char));

int j = 3;
int m = 1;


int trace_me(int param1, int param2, char uc)
{
	static int p;
	static int o;
	int n;
	n = 3;
	m++;
	
	if(param1 == 0)
	{
		p = m;
		o = param2;
		n = param1;
		char NAME[] = "\n%d\t%d\t%d\t%d\t%d\t%d\n";
		printf(NAME, p, o, n);
	}else{
		o++;
		p++;
		param2++;
		c1++;
		trace_me(param1 - 1, param2);
	}
	
	return 0;
}
