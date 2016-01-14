#include<stdio.h>
#include<stdbool.h>
#include<omp.h>  

int main() 
{  
	int n=100000;  
	bool arr[100000];  
	int i, j ,num;  
	
	for(i=0; i<n; i++)   
		arr[i]=0;    
	
	omp_set_num_threads(4);
	#pragma omp parallel  
	{   
		for(i=1; i<n; i++)   
		{    
			if(arr[i]==0)    
			{     
				j=i+1;     
				#pragma omp while     
				while((num=j*(i+1))<=n)     
				{      
					arr[num-1]=1;      
					j++;     
				}    
			}   
		}  
	} 
	for(i=1;i<n; i++)
	{   
		if(arr[i]==0)
			printf("%d,\t", i+1);  
	}
	printf("\n\n");
} 
