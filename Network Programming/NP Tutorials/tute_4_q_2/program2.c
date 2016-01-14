#include<stdio.h>
#include<sys/ipc.h>
#include<sys/msg.h>
#include<stdlib.h>
#define MAXMSG (8192+sizeof(long))
struct mymsgbuf
{
    long mtype;
    char *mtext;
};
int main(int argc,char **argv)
{
    int mqid,n,flag;
    long type;
    struct mymsgbuf *buff;
    flag=0;
    if(argc!=3)
        printf("usage:msgrvc<pathname><type>");
    //mqid=msgget(ftok(argv[1],0),0400);
    type=atoi(argv[2]);
    buff=malloc(MAXMSG);
    n=msgrcv(524299,buff,MAXMSG,type,flag);
    printf("read %d bytes,type=%ld\n",n,buff->mtype);
    exit(0);
}