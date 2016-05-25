#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  char c;
  int read_count;

  char searched = argv[1][0];
  for (int i = 2; i < argc; ++i) {
    if (!fork()) {
      char *filename = argv[i];
      int fd = open(filename, O_RDONLY);

      int count = 0;
      while ((read_count = read(fd, &c, 1))) {
        if (c == searched) {
          count++;
        }
      }

      printf("%d %s\n", count, filename);

      close(fd);
      return 0;
    }
  }

  for (int i = 2; i < argc; ++i) {
    int status;
    wait(&status);
  }

  return 0;
}
