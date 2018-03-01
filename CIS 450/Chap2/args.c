int main(int argc, char **argv, char **envp)
{
	char *ptr, ch; 
        int i, j,k;

	

    j = 0;
    while((ptr = envp[j++]) != 0)
    {
          k = 0;
          while ((ch = ptr[k++]) != 0)
            printf("%c", ch);
          printf("\n");
    }

	for(i = 0; i < argc; i++)
	  printf("%s\n", argv[i]);
        printf("\n");
     
	return 0;
} 
