#include "omp.h"

void main()
{
	omp_set_num_threads(4);
	#pragma omp parallel
	{
	
		int ID=omp_get_thread_num();
		printf("Hello(%d)",ID);
		printf("World(%d)",ID);
	}
	
}
