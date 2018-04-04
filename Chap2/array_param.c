void f();

int main()
{
    int a[10][20];
    int i, j;
    for (i = 0; i < 10; i++)
     for (j = 0; j < 20; j++) 
       a[i][j] = i*10 + j;  

    f(a);
}

//void f(int (*b)[20])
//void f(int b[100][20])
void f(int b[][20])
{
    int i, j;
    for(i = 0; i < 10; i++)
    {
     for (j = 0; j < 20; j++)
        printf("%d\t", b[i][j]);
     printf("\n");
    }
} 
      
