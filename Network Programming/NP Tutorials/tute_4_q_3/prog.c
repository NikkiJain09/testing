#include<stdio.h>
#include"student.h"
#include"student_xdr.c"

int main(int argc,char **argv)
{

int i;
struct student x;
XDR xhandle;
char *buff;
long *lptr;
size_t size;
if(argc!=5)
printf("Arguments not proper");
else                                                                                                                              
{
x.enrollment_no=atoi(argv[1]);
x.name=argv[2];
x.age=atoi(argv[3]);
x.address=argv[4];
}
//printf("%d\n",x.enrollment_no);
//printf("%s\n",x.name);
//printf("%d\n",x.age);
//printf("%s\n",x.address);
buff=malloc(100);
if(buff==NULL)
printf("error");

else
{
xdrmem_create(&xhandle,buff,100,XDR_ENCODE);
if(xdr_student(&xhandle,&x)!=TRUE)
printf("xdr_data error\n");
size=xdr_getpos(&xhandle);
lptr=(long*) buff;
for(i=0;i<size;i+=4)
printf("%lx\n",(long) ntohl(*lptr++));
exit(0);
}

return 0;
}
