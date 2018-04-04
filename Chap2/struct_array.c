#include <stdio.h>


typedef struct {
  int a[10];
} ToCopyArray;

void f(ToCopyArray tCA, int *b);

void main()
{
  int b[10];
  ToCopyArray toCopyArray;
  int i;
   
  printf("\nIn Main (before calling f)\n");
  printf("a in struct\t\tb\n");
  for(i = 0; i < 10; i++)
  {
     toCopyArray.a[i] = i;
     b[i] = i;
     printf("%d\t\t\t%d\n", toCopyArray.a[i], b[i]);
  }

  f(toCopyArray, b);

  printf("\nIn Main (after calling f)\n");
  printf("a in struct\t\tb\n");
  for(i = 0; i < 10; i++)
  {
    printf("%d\t\t\t%d\n", toCopyArray.a[i], b[i]);
  } 
}

void f(ToCopyArray tCA, int *b)
{
  int i;
  for(i = 0; i < 10; i++)
  {
    tCA.a[i] *= 2;
    b[i] *= 2; 
  }
  printf("\nIn f (after modification)\n");  
  printf("a in struct\t\tb\n");
  for(i = 0; i < 10; i++)
  {
    printf("%d\t\t\t%d\n", tCA.a[i], b[i]);
  } 
}  
