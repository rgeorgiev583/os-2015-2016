#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

#define BUFSIZE 1000

size_t fgetlen(int fd)
{
    static char buf[BUFSIZE];
    size_t count = 0;
    ssize_t len;

    while (len = read(fd, buf, BUFSIZE))
        count += len;

    return count;
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        printf("%u\n", fgetlen(0));
        return 0;
    }

    for (size_t i = 1; i < argc; i++)
        if (!fork())
        {
            int fd = open(argv[i], O_RDONLY);
            printf("%u %s\n", fgetlen(fd), argv[i]);
            close(fd);
            exit(0);
        }

    int status;

    for (size_t i = 1; i < argc; i++)
    {
        wait(&status);
    }

    return 0;
}
