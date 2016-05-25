#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string>

int main (int argc, char* argv[])
{
    int fds[1000];
    for (int i = 2; i < argc; ++i)
    {
        char *filename = argv[i];
        fds[i - 2] = open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644);
    }

    char c;
    if(strcmp(argv[1], "-c")==0)
    {
        for (int i = 2; i < argc; ++i)
        {
            int bytes=0;
            while( read(fds[i], &c, 1) )
            {
                bytes++;
            }
            printf("File %f count %c": argv[i], bytes);
        }
    }
    if(strcmp(argv[1], "-w")==0)
    {
        for (int i = 2; i < argc; ++i)
        {
            int words=0;
            while( read(fd1, &c, 1) )
            {
                if(c=='\n' || c==' ')
                    words++;
            }
            printf("File %f count %c": argv[i], words);
        }
    }
    if(strcmp(argv[1], "-l")==0)
    {
        for (int i = 2; i < argc; ++i)
        {
            int lines=0;
            while( read(fd1, &c, 1) )
            {
                if(c=='\n')
                    lines++;
            }
            printf("File %f count %c": argv[i], lines);
        }
    }

    for (int i = 2; i < argc; ++i)
        close(fds[i - 2]);

    return 0;
}
