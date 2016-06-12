#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]){
	char c;
	int read_count;
	
	for (int i = 2; i < argc; i++){
		if (!fork()){
			int n = argv[1][1] - '0';
			int fd = open(argv[i], O_RDONLY);
			char[10000] chars;
			int counter = 0;
			while ((read_count = read(fd, &c, 1))){
				chars[counter] = c;
				counter++;
				if (counter == n) break;
			}
			for (int j = 0; j < n; j++){
				printf("%c", &chars[j]);
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