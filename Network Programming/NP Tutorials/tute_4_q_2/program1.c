#include<stdio.h>
#include<sys/ipc.h>
#include<sys/msg.h>
#include<stdlib.h>

int main(int argc,char **argv)
{
    int len,mqid;
    long type;
    struct msgbuf *ptr;
    if(argc!=4)
        printf("usage:msgsnd<pathname><#bytes><type>");
    len=atoi(argv[2]);
    type=atoi(argv[3]);
    mqid=msgget(ftok(argv[1],0),0200);
    ptr=(struct msgbuf*)calloc(sizeof(long)+len,sizeof(char));
    printf("%ld",ptr->type);
    ptr->mtype =type;
    msgsnd(mqid,ptr,len,0);
    exit(0);
}