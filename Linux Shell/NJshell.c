#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include<string.h>
#include<fcntl.h>
#include<signal.h>
#include<readline/readline.h>
#include<readline/history.h>

static int arg=0;
char *cmnd[20]={NULL},*p[20]={NULL},*user_input, *line_read;
void functions(int no)
{
		//Implementation of cd Command
			if(strcmp(cmnd[no], "cd")==0)
			{
				int v;
				if(strcmp(cmnd[no +1],"/")==0)
					v=chdir("/home");
				else
					v=chdir(cmnd[no+1]);
				if(v!=0)
				{
					printf("\nError Reported:\n");
				}
			}
		//Make directory
			else if(strcmp(cmnd[no], "md")==0)
			{       
				int v1=mkdir(cmnd[no+1]);
				if(v1!=0)
					printf("\nError");
			}
		//Delete directory 
			else if(strcmp(cmnd[no], "rd")==0)
			{       
				int v1=rmdir(cmnd[no+1]);
				if(v1!=0)
					printf("\nError");
			}
		//Copy Files
			else if(strcmp(cmnd[no], "cp")==0)
			{       
				int fd=copyFiles(cmnd[1], cmnd[2]);
                            	if(fd==-1)
			             printf("\nSorry, Copy operation failed.\nError: %s", strerror(fd));
			}
		//exit
			else if(strcmp(cmnd[no], "exit")==0)
			{       
				exit(0);
			}		
		//echo
			else if(strcmp(cmnd[no], "echo")==0)
			{       
				printf("\nYou Entered: %s\n",cmnd[no+1]);
				exit(0);
			}	
		//Others
			else
	    		{
				execvp(cmnd[no],cmnd+no);
			}
}

char * rl_gets ()
{
    char * cwd,buff[1000];
    char nk[50];
	if(line_read)
	{
		free (line_read);
		line_read = (char *)NULL;
    }
    strcpy(nk, "<NIKKI ");
	cwd = getcwd( buff,1000 );
    strcat(nk,cwd);
    strcat(nk,">#");
	line_read = readline (nk);
	if(line_read && *line_read)
		add_history(line_read);
	return (line_read);
}

int tokens(char **c, char *u_i)
{
	char* ptr=NULL;
	ptr= strtok(u_i, " ");
	c[arg++]=ptr;    
	while(((ptr=strtok(NULL," "))!= NULL) && (arg<20))
	{
		c[arg++]=ptr;
	} 
	c[arg]=NULL;	
	return arg++;
}


int copyFiles(char *source, char *destination)
{
  int in_fd, out_fd, n_chars;
  char buf[1000];
  
  /* open files */
  if( (in_fd=open(source, O_RDONLY)) == -1 )
  {
	printf("\nSorry, this operation failed.\nError: %s", strerror(in_fd));
  }
 
  if((out_fd=open(destination, O_WRONLY| O_APPEND|O_CREAT))==-1)
  {
	printf("\nSorry, this operation failed.\nError: %s", strerror(out_fd));
  }
 
 
  /* copy files */
  while( (n_chars = read(in_fd, buf, 1000)) > 0 )
  {
    if( write(out_fd, buf, n_chars) != n_chars )
    {
	printf("\nSorry, Write to operation failed.\nError: %s", strerror(out_fd));
    }
 
    if( n_chars == -1 )
    {
	printf("\nSorry, read from operation failed.\nError: %s", strerror(n_chars));
    }
  }
	write(out_fd, "\n#This is a replicate copy\n", 32);
 
    /* close files */
    if( close(in_fd) == -1 || close(out_fd) == -1 )
    {
	printf("\nSorry, closing operation failed.\n");
    }
 
   return 1;
}


void background_job()
{
	int pid;
        cmnd[1]=NULL;
	execvp(cmnd[0],cmnd);
}

static void sgnl (int sig, siginfo_t *siginfo, void *context)
{ 
    //No action
}
static void segv()
{
    printf("\nYou made an Illegal Memory Reference!\n");
}
static void read_terminal()
{
    printf("\nProcess you are executing is not allowed to read from terminal\n");
}
static void write_terminal()
{
    printf("\nProcess you are executing is not allowed to write to terminal\n");
}
static void suspending()
{
    printf("\nProcess is terminating, Bye\n");
    kill(getpid(), SIGABRT);
}
static void pipe_write()
{
    printf("\nNo need to write onto the pipe as the reader has terminated\n");
}


int main(int argc, char **argv, char **envp)
{
    char *ptr_pipe=NULL,*cmnd_pipe[50]={NULL};
    int pid,vi=1,i,fd,n,a=0,v=20,j=0,il=0,fc=0,control=1;
    i=0;
    signal(SIGSEGV, segv);
    signal(SIGTSTP, suspending); //cntrl+z
    signal(SIGQUIT, suspending); /* cntrl+\  */
    signal(SIGALRM, SIG_IGN);    //ignores sigalarm
    signal(SIGPIPE, pipe_write);	
    signal(SIGTTIN, read_terminal);
    signal(SIGTTOU, write_terminal);
	while(control)
	{
		fc=0;
		char* cwd;
	    int xa=0;
		arg=0;
		user_input=rl_gets ();
		//Pipe
		if( strchr(user_input, '|')!=NULL)
		{
			int arg_pipe=0, pid1, pid2,x=1,count=0;
			int n1[50]={0};
			fc=1;
			char *px;
			//Counting no of pipes in the user_input
			for (px = user_input; *px; px++) 
        			if (*px == '|') 
					count++;
			char * saveptr;
			ptr_pipe= strtok_r(user_input, "|",&saveptr);
			int i=0;
			int p[2]={-1,1}, p1[2]={0,1}, v=0;
			n1[arg_pipe++]=0;
			do
			{
				cmnd_pipe[arg_pipe]=ptr_pipe;
		     	        n1[arg_pipe]=tokens(cmnd, cmnd_pipe[arg_pipe])+1;
				arg_pipe++;
				pipe(p);
				int child_pid;
				if((child_pid=fork())==0)
				{	//child
					//printf("in %d th command writing to %d\n",i+1,p[1]);
					//printf("in %d th command reading from %d\n",i+1,p1[0]);
					if (i != count)//not last command
					{
			                    dup2(p[1],1);
					    close(p[0]);
					    close(p[1]);
					}
			                if (i != 0) //not first command
					{
						dup2(p1[0],0);
						close(p1[0]);
						close(p1[1]);
					}
					v=n1[i];
					functions(v);
				}
				if(i!=0)
				{
					close(p1[0]);
					close(p1[1]);
				}
				p1[0]=p[0];
				p1[1]=p[1];
				waitpid(child_pid,NULL,0);
				if(i==count)
				{	close(p1[0]);
					close(p1[1]);
				}	
				i++;
			}while((ptr_pipe=strtok_r(NULL,"|",&saveptr))!= NULL);
			cmnd_pipe[arg_pipe]=NULL;
		}
		//Redirection
		else if((strchr(user_input, '>')!=NULL) || (strchr(user_input, '<')!=NULL) )
		{	
			int pid1=fork();
			if(pid1==0)
			{
				if(strchr(user_input, '>')!=NULL) //application > file: redirect stdout of app to file(write output to file)
				{
					if(strchr(user_input, '>')!= strrchr(user_input, '>'))
					{
						ptr_pipe= strtok(user_input, ">>");
						cmnd_pipe[0]=ptr_pipe;
						ptr_pipe=strtok(NULL, ">>");
						char* ptr=NULL;
						ptr= strtok(cmnd_pipe[0], " ");
						cmnd[a++]=ptr;    
						while(((ptr=strtok(NULL," "))!= NULL) && (arg<20))
							cmnd[a++]=ptr;
						cmnd[a]=ptr_pipe;
			    			fd=open(cmnd[a], O_WRONLY| O_APPEND|O_CREAT); //Open a file with fd no = 1
                            			if(fd==-1)
			                                printf("\nSorry, this operation failed.\nError: %s", strerror(fd));
					}
					else
					{
						ptr_pipe= strtok(user_input, ">");
						cmnd_pipe[0]=ptr_pipe;
						ptr_pipe=strtok(NULL, ">");
						char* ptr=NULL;
						ptr= strtok(cmnd_pipe[0], " ");
						cmnd[a++]=ptr;    
						while(((ptr=strtok(NULL," "))!= NULL) && (arg<20))
							cmnd[a++]=ptr;
						cmnd[a]=ptr_pipe;
				    		fd=open(cmnd[a], O_WRONLY| O_TRUNC|O_CREAT); //Open a file with fd no = 1
                        			if(fd==-1)
                        			        printf("\nSorry, this operation failed.\nError: %s", strerror(fd));
					}
					//printf("\n");
					dup2(fd, STDOUT_FILENO);
					close(fd);						
				}
				if(strchr(user_input, '<')!=NULL) //application < file: redirect stdin of app from file (read input from file)
				{
					ptr_pipe= strtok(user_input, "<");
					cmnd_pipe[0]=ptr_pipe;
					ptr_pipe=strtok(NULL, "<");
					char* ptr=NULL;
					ptr= strtok(cmnd_pipe[0], " ");
					cmnd[a++]=ptr;    
					while(((ptr=strtok(NULL," "))!= NULL) && (arg<20))
						cmnd[a++]=ptr;
					cmnd[a]=ptr_pipe;
					fd=open(cmnd[a], O_RDONLY); //Open file with fd - 0
                    			if(fd==-1)
		                                printf("\nSorry, this operation failed.\nError: %s", strerror(fd));
					dup2(fd, STDIN_FILENO);
					close(fd);
    				}
				cmnd[a+1]=NULL;
				functions(0);
			}		
			else 
			{
				waitpid(-1,NULL,0);
			}
		}
		//Background process execution
		else if(strchr(user_input, '&')!=NULL)
		{
			fc=1;
			int xc=tokens(cmnd, user_input);
			struct sigaction act;
 			memset (&act, '\0', sizeof(act));
			act.sa_sigaction = &sgnl;
			act.sa_flags = 0;	
			sigaction(SIGCHLD, &act, NULL);
			xc=vfork();   
			if(xc==0)
			{
				printf("\n+[Started job]: %d\n", getpid()); 
            			background_job();
				exit(0);
			}		
		}
		else
	        {
			int x;
			x=tokens(cmnd,user_input);
		}
		if(fc==0)
		{
			pid=fork();
			if(pid==0)
			{		
				functions(0);
			}		
			else 
			{
				waitpid(pid,NULL,0);
			}
		}
	}
	return 0;
}
