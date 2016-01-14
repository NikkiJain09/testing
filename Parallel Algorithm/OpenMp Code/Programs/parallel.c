#include <stdio.h>
#include <math.h>
#include <time.h>
#include "omp.h"
#define N 1000000
//Marked(value 1) means prime

char list[N+1];
void prime(unsigned long long in)
{
	unsigned long long j=0;
	#pragma omp parallel private(j)
	{
		for(; in<=sqrt(N); in++)
		{
			while((list[in]!=1) && (in<=N))
				in++;
			#pragma omp for nowait
			for(j=in*in;j<=N; j=j+in)
				list[j]=0;
		}
	}
}

int main()
{
	clock_t start, end;
	double cpu_time_used;
	start = clock();
	int count=0;
	unsigned long long i,c,j=0;
	//omp_set_num_threads(4);
	#pragma omp parallel private(i,c)
	{
		#pragma omp for nowait
		for(i=0;i<N; i++)
			list[i]=1;
		for(c=2; c<=sqrt(N); c++)		
			prime(c);
	}
	for(j=0; j<N; j++)
	{
		if(list[j]==1)
		{
			count++;
			printf("%lld ",j);
		}
	}
	end = clock();
     	cpu_time_used = ((double) (end - start))/ CLOCKS_PER_SEC;
	printf("\nTime Taken: %f\n", cpu_time_used/3600);		
	printf("\nNo of Primes: %d\n",count);

	return 0;
}
