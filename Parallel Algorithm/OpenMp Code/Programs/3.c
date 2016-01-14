#include<iostream>
#include"omp.h"

int main()
{
	int A[10]={1,2,3,4,5,6,7,8,9,10},sum=0;
	A[0]++;
	omp_set_num_threads(4);
	#pragma omp parallel
	{		
		#pragma omp for
		for(int i=0; i<10; i++)
			sum+=A[i];	
		std::cout<<"\nHi";
		#pragma omp single		
		std::cout<<"\nhello";
	}
	std::cout<<"\nTotal Sum: "<<sum<<"\n";
	return 0;
}
