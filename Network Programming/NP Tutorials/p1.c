/*TCP Echo Server*/

#include<netinet/in.h>
#include<sys/socket.h>
#include<stdlib.h>
#include<unistd.h>
#include<strings.h>
#include<fcntl.h>
#include<stdio.h>

int main(int argc, char **argv)
{
	int listenfd, connfd;
	int n;
	struct sockaddr_in servaddr,cliaddr;
	socklen_t clilen;
	
	char line[1000];
	pid_t childpid;

	listenfd = socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family      = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port        = htons(9877);

	bind(listenfd, (struct sockaddr *) &servaddr, sizeof(servaddr));
	listen(listenfd, 5);

	for ( ; ; ) 
	{
		printf("\nserver started\n");
	  	clilen = sizeof(cliaddr);
	  	connfd = accept(listenfd, (struct sockaddr*) &cliaddr, &clilen);
	
	  	if ( (childpid = fork()) == 0) 
		{	/* child process */
			close(listenfd);	/* close listening socket */
			n = read(connfd, line, 512);
                	write(connfd, line, n);
			close(connfd);
			exit(0);
		}
		
		close(connfd);	
		//waitpid(childpid);
		//wait(childpid);
		//close(listenfd)	;
 	  }
}
