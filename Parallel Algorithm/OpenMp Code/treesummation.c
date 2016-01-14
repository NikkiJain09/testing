#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<omp.h>

main()
{
	int arr[]={4,3,8,2,9,1,0,5};
	int logn, k, d, num, n=8;
	logn = ceil((log(n))/(log(2)));
	num = arr[n-1];
	omp_set_num_threads(logn+2);
		for(d=0; d<=logn-1; d++)
		{
			#pragma omp parallel
			{
				if(omp_get_thread_num()!=0)
				{
					int var = (int)pow(2,(d+1));
					int var2 = (int)pow(2,d);
					int i=(omp_get_thread_num()-1)*(var);
					arr[i+var-1] = arr[i+var2-1] + arr[i+var-1];
				}
			}
		}
	arr[n-1]=0;

	for(d=logn-1; d>=0; d--)
	{
		#pragma omp parallel
		{
			if(omp_get_thread_num()!=0)
			{
				int var = (int)pow(2,(d+1));
				int var2 = (int)pow(2,d);
				int i=(omp_get_thread_num()-1)*(var);
				int temp = arr[i+var2-1];
				arr[i+var2-1] = arr[i+var-1];
				arr[i+var-1] = temp+arr[i+var-1];
			}
		}
	}
	printf("Prefix sum = ");
	for(k=1; k<=n-1; k++)
		printf("%d  ", arr[k]);
	
	printf("%d", num+arr[n-1]);	
	return 0;
}
