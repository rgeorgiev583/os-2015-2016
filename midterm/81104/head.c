#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>
// These headers are necessary.

// Concurrency is done right!  (+0.3)

int main(int argc, char *argv[]){
	char c;
	int read_count;

	for (int i = 2; i < argc; i++){
		if (!fork()){
		    //   The first digit of the number is `argv[1][0]`, not `argv[1][1]`.
		    // (-0.1)
		    //   Also, you could have used `atoi` to read the whole number, not
		    // just the first digit.  Like this:  (-0.1)
		    //int n = atoi(argv[1]);
			int n = argv[1][0] - '0';
			int fd = open(argv[i], O_RDONLY);
			// How do you declare an array in C?  (-0.1)
			char chars[10000];
			int counter = 0;
			while ((read_count = read(fd, &c, 1))){
				chars[counter] = c;
				counter++;
				if (counter == n) break;
			}
			for (int j = 0; j < n; j++){
			    //   Why do you print the addresses of the characters?
			    // You have to print the actual characters.  (-0.2)
			    //   Also, you can replace `printf` with `write` here.  (-0.1)
			    // Like this:
			    //write(0, chars, n);
				printf("%c", chars[j]);
			}
			close(fd);
		}
	}

	for (int i = 2; i < argc; i++){
		int status;
		wait(&status);
	}
	return 0;
}

// Total points for this task:  1.7/2
