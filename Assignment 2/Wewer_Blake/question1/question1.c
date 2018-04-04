#include <stdio.h>

short ui = malloc(sizeof(short));

int i = 24;
short s1 = 12; 

static short u2;

int main(int argc, char **argv, char **envp)
{
	int y;
	int x;
	char c;
	
	x = s1 + 3 * i + 6;
	u2 = x;
	ui = s1 + 15;
	
	c = 5;
	y = 0;										//53
	
	while(x > 0)
	{
		y++;
		x = x - u2 - c;
	}
	
	if(x < (i * 2))								//x = -5
	{
		ui = c * u2 * 4 + 45;
	}else{
		i = x + y - 2 * c;
	}
	
	return 0;
}
