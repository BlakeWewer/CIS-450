#include <libcmt.h>
#include <oldnames.h>

//cmd	source, dest

int i1 = 5;
static int i2;
unsigned short s1 = 3;
static unsigned short s2;

void func(int fp1, int fp2, int fp3)
{
	short f1;
	unsigned short f2;
	int f3;
	i1 = i1 - 1;
	if(s1 < i1)
	{				//L3
		while(1 >= i2)
		{			//L4
			f1 = s1 + fp1;
			f2 = fp2 - s1;
			i2 = i2 + 1;
		}			//L3
		//eax = f1
		//edx = f1
		//edx = f1 + fp3
		//eax = f2
		//eax = f2 + f1 + fp3
		f3 = f2 + f1 + fp3;
		
		//eax = s2
		s2 = s2 + 1;
		
		func(f1, f2, f3);
		
	}else{			//L2
		//eax = i1
		//edx = i1
		//eax = s1
		//edx = i1 + s1
		//eax = s2
		//eax = i1 + s1 + s2
		s2 = i1 + s1 + s2;
		
		//eax = s2
		//ebx = s2
		//eax = s1
		//ecx = s1
		//edx = i2
		//eax = i1
		//s2
		//s1
		//i2
		//i1
		printf("%d\11%d\11%d\11%d\12\0", i1, i2, s1, s2);		
	}				//L1
}

void main(int argc, char **argv, char **envp)
{
	int m1 = 8;
	signed short m2 = 5;
	
	func(m1, m2, 9);
}