#include <stdio.h>

int x = malloc(sizeof(int));
static int y = 20;

int main()
{
	int j;
	int i = 20;
	
	while(i <= 30)
	{
		x = (i * y) + 33;
		
		if(x <= 20)
		{
			j = x;
		}else{
			j = x + 2;
		}
		
		i++;
	}
	
	return 0;
}