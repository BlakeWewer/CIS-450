/////////////////////////////////////////////////
//   Example of Pointer to Function
//     by Masaaki Mizuno
//     written for Learning Tree Course 223P, (c) 2006
//////////////////////////////////////////////////
int AddTest(){int x;   x = 100; return x;}

int main() {
  int (*fpt)() = AddTest;

  printf("fpt = %d\n", fpt);
  printf("fpt+1 = %d\n", fpt+1);  // just to see the size of type function
  printf("size of AddTest = %d\n", sizeof(AddTest));
  printf("size of main = %d\n", sizeof(main));
}

