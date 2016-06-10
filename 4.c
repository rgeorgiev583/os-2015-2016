#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

#define BUFSIZE 1000
#define ARGSIZE 1000

int main(int argc, char** argv)
{
    char buf[BUFSIZE];
    char* args[ARGSIZE];
    ssize_t len;
    write(1, "$ ", 2);

    while (len = read(0, buf, BUFSIZE) && *buf && *buf != '\n')
    {
        args[0] = strtok(buf, " \t\n");

        if (!strcmp(args[0], "exit") || !strcmp(args[0], "quit"))
            return 0;

        size_t i = 0;

        while (args[++i] = strtok(NULL, " \t\n"));
        args[i - 1] = NULL;

        if (!fork())
            execvp(args[0], args);
        else
        {
            int status;
            pid_t cpid = wait(&status);
            printf("Child %d exited with status code %d.\n", cpid, WEXITSTATUS(status));
        }

        write(1, "$ ", 2);
    }

    return 0;
}
