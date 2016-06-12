#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

// There is no concurrency (no `fork`, no `wait`).  (-0.5)
// At least the extra credit is implemented.  (+1)

//   `argv` points to an array of pointers to strings.  It does not itself point
// to a string.
int main(int argc, char** argv) {
    int characters = 0;
    int words = 0;
    int lines = 0;

    // Hmm, argument validation.  (+0.1)
    if (argc < 2) { exit (99); }
    else {
        for(int i = 1; i < argc; i++) {
        //   `fopen` is a high-level library function for buffered I/O.
        // It is NOT a low-level syscall wrapper (`open`) which you should use
        // instead!  (-0.3)
	    //FILE *f = fopen(argv[i], "r");
	    int f = open(argv[i], O_RDONLY);
	    char c;
	    //   `read` accepts a file descriptor number (i.e. `int`) as its
	    // first argument.
	    while(read(f, &c, 1)) {
	        //   Newline is escaped in C strings using `\n`, not `/n`.
	        // Also, strings cannot be compared using `==`.  Maybe you want to
	        // compare characters, in which case you want `'\n'` instead of
	        // `"\n"`.  (-0.1)
	    	//if (c == "/n") {
	    	if (c == '\n') {
	            words++;
				lines++;
		}

		if (c == ' ') {
		    words++;
		}

		characters++;
	    }

        // You should use `close` instead of `fclose` (see the note for `open`).
	    //fclose(f);
	    close(f);
	}
    }
    // Only the total count for all files is displayed.  (-0.2)
    printf("%u characters, %u words, %u lines", characters, words, lines);
}

// Total points for this task:  2/2
