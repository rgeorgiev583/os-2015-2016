#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string>

int main (int argc, char* argv[])
{
    if(strcmp(argv[1], "-c")==0)
    {
        int fds[1000];
        for (int i = 3; i < argc; ++i)
        {
            char *filename = argv[i];
            fds[i - 3] = open(filename, O_WRONLY, 0644);
        }

        char c;

        int times=0;
        for (int i = 3; i < argc; ++i)
        {
            while( read(fds[i], &c, 1) )
            {
                if(c==(argv[1])[0])
                    times++;
            }
        }
        printf("%t/n":times);

        for (int i = 3; i < argc; ++i)
            close(fds[i - 3]);
    }

    else
    {

        int fds[1000];
        for (int i = 2; i < argc; ++i)
        {
            char *filename = argv[i];
            fds[i - 2] = open(filename, O_WRONLY, 0644);
        }

        char c;

        for (int i = 2; i < argc; ++i)
        {
            int times=0;
            while( read(fds[i], &c, 1) )
            {
                if(c==(argv[1])[0])
                    times++;
            }
            printf("%t/n":times);
        }

        for (int i = 2; i < argc; ++i)
            close(fds[i - 2]);
    }

    return 0;
}
