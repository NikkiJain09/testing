/*TCP Echo Client*/

#include<netinet/in.h>
#include<sys/socket.h>
#include<stdlib.h>
#include<unistd.h>
#include<strings.h>
#include<fcntl.h>
#include<stdio.h>
#include<string.h>
#define PORT 50008


int main(int argc, char **argv)
{
	int			sockfd;
	struct sockaddr_in	servaddr;
	char sendline[1000];
	char recvline[1000];

	int n;

	if (argc != 2)
		printf("usage: tcpcli <IPaddress>");

	sockfd = socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = inet_addr(argv[1]);
	servaddr.sin_port = htons(PORT);

	connect(sockfd, (struct sockaddr*) &servaddr, sizeof(servaddr));

	fgets(sendline, 512, stdin);		/* do it all */
	n = strlen(sendline);
	write(sockfd, sendline, n);
	n = read(sockfd, recvline, 512);
	if (n < 0)
	{
		printf("unable to read");
	}
    printf("\nread value %d\n",n);
	recvline[n] = '\0';
	fputs(recvline, stdout);
	exit(0);
}


