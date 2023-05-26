#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <assert.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    printf("I’m SHELL process, with PID: %d - Main command is: man grep | grep -A 3 -e -A\n", getpid());
	int fd[2];
	pipe(fd);

    int rc1 = fork();
    if (rc1 < 0) {
		fprintf(stderr, "fork failed\n");
		exit(1);
	}
	if (rc1 == 0) { // man
        printf("I’m MAN process, with PID: %d - My command is: grep\n", getpid());

        dup2(fd[1], STDOUT_FILENO);
        close(fd[0]);
        close(fd[1]);

        char *myargs[3];
        myargs[0] = strdup("man");	
        myargs[1] = strdup("grep"); 
        myargs[2] = NULL;     
        execvp(myargs[0], myargs);
    }
    int rc2 = fork();
    if (rc2 < 0) {
		fprintf(stderr, "fork failed\n");
		exit(1);
	}
    if (rc2 == 0) { // grep
        dup2(fd[0], STDIN_FILENO);
        close(fd[0]);
        close(fd[1]);

        int fd = open("output.txt", O_CREAT | O_TRUNC | O_RDWR, 0644);
        if (fd < 0) {
            perror("open()");
            exit(EXIT_FAILURE);
        }
        printf("I’m GREP process, with PID: %d - My command is: -A 3 -e -A\n", getpid());

        close(STDOUT_FILENO);
        dup2(fd, STDOUT_FILENO);

        char *myargs[6];
        myargs[0] = strdup("grep");	
        myargs[1] = strdup("-A");
        myargs[2] = strdup("3"); 
        myargs[3] = strdup("-e"); 
        myargs[4] = strdup("-A");
        myargs[5] = NULL;     
        execvp(myargs[0], myargs);
    }
    close(fd[0]);
    close(fd[1]);

    waitpid(rc1, NULL, 0);
    waitpid(rc2, NULL, 0);
    printf("I’m SHELL process, with PID: %d - execution is completed, you can find the results in output.txt\n", getpid());
	
	return 0;
}