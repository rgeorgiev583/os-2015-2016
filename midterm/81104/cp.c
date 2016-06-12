#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]){
	char c;
	int read_count;
	for (int i = 1; i < argc; i++){
		if (!fork()){
			int fd1 = open(argv[i], O_RDONLY);
			char *dest_dir;
			asprintf(dest_dir, "%s%s", argv[argc], argv[i]);
			int fd2 = open(dest_dir, O_WRONLY | O_APPEND | O_CREAT);
			while ((read_count = read(fd1, &c, 1))){
				write(fd2, c, 1);
			}
			
			close(fd1);
			close(fd2);
		}
	}
	
	for (int i = 1; i < argc; i++){
		int status;
		wait(&status);
	}
	return 0;
}