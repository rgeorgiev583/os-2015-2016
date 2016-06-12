#define _GNU_SOURCE

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/wait.h>
// These headers are necessary.

// Concurrency is done right!  (+0.3)

int main(int argc, char *argv[]){
	char c;
	int read_count;
	//   The number of arguments is `argc`, so you should be going up to the
	// last argument (i.e. `argc - 1`), but NOT including it.  (-0.2)
	for (int i = 1; i < argc - 1; i++){
		if (!fork()){
			int fd1 = open(argv[i], O_RDONLY);
			char *dest_dir;
			// The last argument is arg[argc - 1], NOT arg[argc].
            // `asprintf` accepts as first argument a double pointer.
			asprintf(&dest_dir, "%s%s", argv[argc - 1], argv[i]);
			//   It would be nice to add `O_TRUNC` and a file mode as the
			// second argument.
			int fd2 = open(dest_dir, O_WRONLY | O_TRUNC | O_CREAT);
			while ((read_count = read(fd1, &c, 1))){
                //   `write` accepts as second argument a pointer, not a char.
                // (-0.1)
				write(fd2, &c, 1);
			}

            //   You ought to deallocate the allocated storage by `asprintf`
            // but this is not a concern right now.
            free(dest_dir);
			close(fd1);
			close(fd2);
		}
	}

	for (int i = 1; i < argc - 1; i++){
		int status;
		wait(&status);
	}
	return 0;
}

// Total points for this task:  2/2
