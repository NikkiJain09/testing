#include"student.h"
#include<stdio.h>
#include<stdlib.h>

int main(int argc,char **argv)
{
CLIENT *cl;
student *head=NULL,*ptr;
int i=0;
int *noc;
for(i=0;i<5;i++)
{
	if(head==NULL)
		{
			ptr=(struct student *)malloc(sizeof(struct student));
			head=ptr;
            ptr->next=NULL;
		}
	else
		{
			ptr->next=(struct student *)malloc(sizeof(struct student));
			ptr=ptr->next;
			ptr->next=NULL;
		}
		printf("Enter the enrollment no, name, age and address seperated with spaces\n");
		//scanf("%d %s %d %s",&ptr->enrollment_no,&ptr->name,&ptr->age,&ptr->address);
        scanf("%d",&ptr->enrollment_no);
        scanf("%s",&(*ptr.name));
        scanf("%d",&ptr->age);
        scanf("%s",&(*ptr.address);
}
ptr=head;
while(ptr!=NULL)
{
	printf("%s",*(ptr.address));
	ptr=ptr->next;
}
/*cl=clnt_create(argv[1],STUDENT_PROG,STUDENT_VERS,"tcp");
    if(cl==NULL)
    {
       printf("cannot create client");
        exit(0);
    }
noc=student_proc_1(head,cl);
printf("No of records sent=%d",*noc);
*/}
