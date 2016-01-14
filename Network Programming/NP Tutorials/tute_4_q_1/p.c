#include<stdio.h>
#include<sys/msg.h>
#include<sys/ipc.h>
#include<sys/shm.h>
int main()
{
    int i,msqid,shmid;
    for(i=0;i<5;i++)
    {
                    msqid=msgget(IPC_PRIVATE,0666|IPC_CREAT);
                    printf("msqid=%d\n",msqid);
		    shmid=shmget(IPC_PRIVATE,20,0666|IPC_CREAT);
		    printf("shmid=%d\n",shmid);
		    msgctl(msqid,IPC_RMID,NULL);
		    shmctl(shmid,IPC_RMID,NULL);
    }
    exit(0);
}


