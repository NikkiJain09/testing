#include<iostream>
#include"omp.h"
int main()
{
	int count=0;	//By default variables in omp treated as shared
	char a, b;
	a='F';
	b='t';
	omp_set_num_threads(4);
	#pragma omp parallel private(b)
	{
		//int x=9;	//Private to each thread
		//std::cout<<"No of threads: "<<omp_get_num_threads();
		//std::cout<<"\nHello World\n";
		//std::cout<<"\nCount: "<<count++;
		//std::cout<<"\nx: "<<x++;
		std::cout<<"\na: "<<a++;
		std::cout<<"\nb: "<<b++<<"\n";
	}
	return 0;
}

