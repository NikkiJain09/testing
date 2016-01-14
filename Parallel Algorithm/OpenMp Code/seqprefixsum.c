#include<stdio.h>
#include<stdlib.h>
#include<omp.h>

main()
{
	int i, j, n=10;
	int arr[]={4,3,8,2,9,1,0,5,6,3};	

	for(i=1; i<n; i++)
			arr[i] = arr[i-1] + arr[i];
	
	printf("Prefix sum is- ");	
	for(i=0;i<n;i++)
		printf("%d   ", arr[i]);
		
	return 0;
}
