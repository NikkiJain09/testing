#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include <time.h>
#define N 1000000

int main()
{
	clock_t start, end;
	double cpu_time_used;
	start = clock();
	unsigned long long i,j=0;
	int count=0;
	unsigned long long list[N+1];
	for(i=0; i<N; i++)
		list[i]=1;
		
	//Marked(value 1) means prime
	i=2;
	while(i<=sqrt(N))
	{
		while((list[i]!=1) && (i<=N))
			i++;
		j=i*i;
		while(j<=N)
		{
			list[j]=0;
			j+=i;
		}		
		i++;
	}
	
	//Printing prime nos
	for(i=0; i<N; i++)
	{
		if(list[i]==1)
		{
			//printf("%lld ",i);
			count++;
		}
	}

	end = clock();
    cpu_time_used = ((double) (end - start))/ CLOCKS_PER_SEC;
	printf("\nTime Taken: %f\n", cpu_time_used/3600);
	printf("\nNo of Primes: %d\n",count);
	return 0;
}
