#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<omp.h>
main()
{
	int k, n=10;
	int arr[]={4,3,8,2,9,1,0,5,6,3};
	int out[]={4,3,8,2,9,1,0,5,6,3};	
	int logn=ceil((log (n))/(log (2)));
	
	omp_set_num_threads(n);
	#pragma omp parallel
	{
	int j;
	
	for(j=0 ; j<=logn; j++)
	{
		int i=omp_get_thread_num();
		int var = (int)pow(2,j);
	
		if((i-var)>=0){
			out[i] = arr[i] + arr[i-var];
	}
	
	
	#pragma omp barrier
	#pragma omp single
	{
		for(k=0; k<n; k++)
			arr[k]=out[k];
	}
		}
	}
	printf("Prefix sum = ");
	for(k=0;k<n;k++)
		printf("%d   ", arr[k]);		
	return 0;
}
