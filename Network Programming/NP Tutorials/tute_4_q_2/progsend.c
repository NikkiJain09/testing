#include<stdio.h>
#include<sys/ipc.h>
#include<sys/msg.h>
#include<stdlib.h>

struct mymsgbuf
{
    long mtype;
    char *mtext;
};

int main(int argc,char **argv)
{
    int len,mqid;
    long type;
    struct mymsgbuf *ptr;
    if(argc!=4)
        printf("usage:msgsnd<pathname><#bytes><type>");
    len=atoi(argv[2]);
    type=atoi(argv[3]);
    mqid=msgget(IPC_PRIVATE,0200|IPC_CREAT|IPC_EXCL);
    if(mqid==-1)
        printf("error\n");
    else
        printf("%d\n",mqid);
    ptr=(struct mymsgbuf*)calloc(sizeof(long)+len,sizeof(char));
    ptr->mtype =type;
    printf("%ld\n",ptr->mtype);
    msgsnd(mqid,ptr,len,0);
    exit(0);
}