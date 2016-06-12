// `wc` implementation

#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
// `.h` was omitted.
#include <unistd.h>
// This header is necessary, too.

// There is no concurrency (no `fork`, no `wait`).  (-0.5)
// At least the extra credit is implemented.  (+1)
// There is no stdin support.

int main (int argc, char* argv[])
{
    int fds[1000];
    for (int i = 2; i < argc; ++i)
    {
        char *filename = argv[i];
        //   This is absolutely a wrong way to open the files!
        // You open them for reading, so the most relevant flag to use is
        // `O_RDONLY`!  (-0.2)
        //fds[i - 2] = open(filename, O_RDONLY);
        fds[i - 2] = open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644);
    }

    //   A bit too much boilerplate code... it is quite a nuisance to read.
    // If you hadn't copied code, it would be much easier for you to correct
    // your mistakes.
    char c;
    if(strcmp(argv[1], "-c")==0)
    {
        for (int i = 2; i < argc; ++i)
        {
            int bytes=0;
            // The fd number is wrong (should have been fds[i - 2])!
            while( read(fds[i], &c, 1) )
            {
                bytes++;
            }
            // The format specifiers are wrong!  (-0.1)
            //printf("File %s count %d\n", argv[i], bytes);
            printf("File %f count %c\n", argv[i], bytes);  // Fixed a typo.
        }
    }
    if(strcmp(argv[1], "-w")==0)
    {
        for (int i = 2; i < argc; ++i)
        {
            int words=0;
            // The fd number is wrong (should have been fds[i - 2])!
            while( read(fds[i], &c, 1) )  // Fixed a typo.
            {
                if(c=='\n' || c==' ')
                    words++;
            }
            // The format specifiers are wrong!
            //printf("File %s count %d\n", argv[i], words);
            printf("File %f count %c\n", argv[i], words);  // Fixed a typo.
        }
    }
    if(strcmp(argv[1], "-l")==0)
    {
        for (int i = 2; i < argc; ++i)
        {
            int lines=0;
            // The fd number is wrong (should have been fds[i - 2])!
            while( read(fds[i], &c, 1) )  // Fixed a typo.
            {
                if(c=='\n')
                    lines++;
            }
            // The format specifiers are wrong!
            //printf("File %s count %d\n", argv[i], lines);
            printf("File %f count %c\n", argv[i], lines);  // Fixed a typo.
        }
    }

    for (int i = 2; i < argc; ++i)
        close(fds[i - 2]);

    return 0;
}

// Total points for this task:  2.2/2
