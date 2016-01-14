#include <iostream>
#include "omp.h"
#include <time.h>
#include <math.h>
#define N 8
int main()
{
	int A[100]={7,0,2,9,5,1,8,6};
	int x=(int)log2(N),i,temp,a,b,last;	
	omp_set_num_threads((N/2)+1);
	last=A[N-1];
	for(int d=0; d<x; d++)
	{
		#pragma omp parallel
		{
			if(omp_get_thread_num()!=0){
				i=(omp_get_thread_num()-1)*pow(2,d+1);
				a=(int)pow(2,d+1);
				b=(int)pow(2,d);
				A[i+a-1]=A[i+b-1]+A[i+a-1];
			}
		}
	}
	A[N-1]=0;
	//x=(int)log (N);
	for(int d=x-1; d>=0; d--)
	{
		#pragma omp parallel
		{
			if(omp_get_thread_num()!=0){
				i=(omp_get_thread_num()-1)*pow(2,d+1);
				a=(int)pow(2,d+1);
				b=(int)pow(2,d);
				temp=A[i+b-1];
				A[i+b-1]=A[i+a-1];
				A[i+a-1]=temp+A[i+b-1];
			}
		}
			
	}
	std::cout<<"\n";		
	for(int kl=0; kl<N; kl++)
	{
		std::cout<<" "<<A[kl];
	}
	std::cout<<" "<<A[N-1]+last<<"\n";
	return 0;
}
