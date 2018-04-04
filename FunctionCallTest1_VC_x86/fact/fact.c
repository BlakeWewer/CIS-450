////////////////////////////////////////////////////////////////////////////
//      fact.c program to test a recursive call in C
//         M. Mizuno (c) 1995, 2004, 2005
//          modified for Learning Tree course 223P
//      NOTE: In gcc for H-8, default for char is "unsigned"
///////////////////////////////////////////////////////////////////////////
/* Draw memory image of execution of the following program */
   int ans;

   void fact(int i)
   {
        /* what will happen if x is declared as internal static */
        int x;

        x = i - 1;
        if  ((i == 0) || (x == 0)) ans = 1;
        else {
          fact(x);
          ans = (x + 1) * ans;
	}
   }

   int main(void)
   {
        fact(3);
	printf("asnswer = %d\n", ans);
	return 0;
   }

