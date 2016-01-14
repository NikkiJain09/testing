#include <stdio.h>
#include <math.h>
#define N 3
char str[(4*N)-2];

int split()
{
	char[][] p;
	int k=0,l=0,max=-1,j;
	for(int i=0; i<((4*N)-2); i++)
	{
		if(str[i]!=" ")
		{
			if(str[i]=="*") //start storing in new array
			{
					k++;
					l=0;
			}
			else
			{
				p[k][l++]=str[i];
			}	
		}
	}
	while(k--)
	{
		j=0;
		while(p[k][j]!="\0")
		{
			j++;
		}
		if(max<j)
			max=j;
	}
	
	return max;
}

int main()
{
	int N,tree[N][N],depth;
	tree[N][N]={{0,1,1},{1,0,0},{1,0,0}};
	
	
	
	
	
	
	traverse path is in str
	trim();
	depth=split();
	printf("Depth of tree is: %d", depth);
	
	return 0;
}
