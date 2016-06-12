// `cgrep` implementation

#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
// `.h` was omitted.
#include <unistd.h>
// This header is necessary, too.

// There is no concurrency (no `fork`, no `wait`).  (-0.5)
// At least part of the extra credit is implemented.  (+0.5)

int main (int argc, char* argv[])
{
    //   A bit too much boilerplate code... it is quite a nuisance to read.
    // If you hadn't copied code, it would be much easier for you to correct
    // your mistakes.
    if(strcmp(argv[1], "-c")==0)
    {
        int fds[1000];
        for (int i = 3; i < argc; ++i)
        {
            char *filename = argv[i];
            //   This is absolutely a wrong way to open the files!
            // You open them for reading, so the most relevant flag to use is
            // `O_RDONLY`!  (-0.2)
            //fds[i - 3] = open(filename, O_RDONLY);
            fds[i - 3] = open(filename, O_WRONLY, 0644);
        }

        char c;

        int times=0;
        for (int i = 3; i < argc; ++i)
        {
            // The fd number is wrong (should have been fds[i - 3])!
            while( read(fds[i], &c, 1) )
            {
                //   This should have been the second argument.
                // (i.e. (argv[2]))  (-0.1)
                if(c==(argv[1])[0])
                    times++;
            }
        }
        //   The format specifiers are wrong!
        // Also, `/n` should have been `\n`.  (-0.2)
        //printf("%d\n", times);
        printf("%t/n", times);  // Fixed a typo.

        for (int i = 3; i < argc; ++i)
            close(fds[i - 3]);
    }

    // See the notes inside the `if` clause.
    else
    {

        int fds[1000];
        for (int i = 2; i < argc; ++i)
        {
            char *filename = argv[i];
            //   This is absolutely a wrong way to open the files!
            // You open them for reading, so the most relevant flag to use is
            // `O_RDONLY`!
            //fds[i - 2] = open(filename, O_RDONLY);
            fds[i - 2] = open(filename, O_WRONLY, 0644);
        }

        char c;

        for (int i = 2; i < argc; ++i)
        {
            int times=0;
            // The fd number is wrong (should have been fds[i - 2])!
            while( read(fds[i], &c, 1) )
            {
                if(c==(argv[1])[0])
                    times++;
            }
            //   The format specifiers are wrong!
            // Also, `/n` should have been `\n`.
            //printf("%d\n", times);
            printf("%t/n", times);  // Fixed a typo.
        }

        for (int i = 2; i < argc; ++i)
            close(fds[i - 2]);
    }

    return 0;
}

// Total points for this task:  1.5/2
