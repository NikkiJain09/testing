/*TCP Echo Server*/

#include<netinet/in.h>
#include<sys/socket.h>
#include<stdlib.h>
#include<unistd.h>
#include<strings.h>
#include<fcntl.h>
#include<stdio.h>
#define PORT 50007

void sigchld(int sig_no)
{
    int stat,pid;
    pid=wait(&stat);
    printf("process %d terminated with status %d\n",pid,stat);
}

int main(int argc, char **argv)
{
	int listenfd, connfd;
	int n;
	struct sockaddr_in servaddr,cliaddr;
	socklen_t clilen;
	
	char line[1000];
	pid_t childpid,childpid2;

	listenfd = socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family      = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port        = htons(PORT);

	bind(listenfd, (struct sockaddr *) &servaddr, sizeof(servaddr));
	listen(listenfd, 5);
    signal(SIG_CHLD,sigchld);

	for ( ; ; ) {
		printf("\nserver started\n");
	  clilen = sizeof(cliaddr);
	  connfd = accept(listenfd, (struct sockaddr*) &cliaddr, &clilen);
        if ( (childpid = fork())< 0)
            printf("\nerror\n");

	  if (childpid == 0) {
          /* child process */
		close(listenfd);	/* close listening socket */
		n = read(connfd, line, 512);     
		write(connfd, line, n);
		close(connfd);
		exit(0);
		}
      
		close(connfd);		
 	  }
}
