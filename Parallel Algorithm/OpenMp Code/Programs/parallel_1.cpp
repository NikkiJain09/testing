#include <stdio.h>
#include <math.h>
#include <time.h>
#include "omp.h"
#define N 1000000
//Marked(value 1) means prime

char list[N+1];
void prime()
{
	int c,j,g=sqrt(N);
	#pragma omp parallel for
	for(c=2; c<=g; c++)	
		if(list[c]==1)	
			for(j=c*c;j<=N;j=j+c)
				list[j]=0;
}

int main()
{
	clock_t start, end;
	double cpu_time_used;
	start = clock();
	int count=0;
	unsigned long long i,c,j=0;
	omp_set_num_threads(3);
	//#pragma omp parallel for
	for(i=0;i<N; i++)
		list[i]=1;
	prime();
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
