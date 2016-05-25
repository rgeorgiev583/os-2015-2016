#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  char c;
  int read_count;

  char option = '\0';
  int startIndex = 1;
  if (argc > 2) {
    if (strcmp(argv[1], "-c") == 0) {
      option = 'c';
      startIndex = 2;
    } else if (strcmp(argv[1], "-w") == 0) {
      option = 'w';
      startIndex = 2;
    } else if (strcmp(argv[1], "-l") == 0) {
      option = 'l';
      startIndex = 2;
    }
  }

  for (int i = startIndex; i < argc; ++i) {
    if (!fork()) {
      char *filename = argv[i];
      int fd = open(filename, O_RDONLY);

      int lines = 0;
      int words = 0;
      int chars = 0;
      while ((read_count = read(fd, &c, 1))) {
        if (c == ' ') {
          words++;
        } else if (c == '\n') {
          lines++;
          words++;
        }

        chars++;
      }

      if (option == 'c') {
        printf("%d %s\n", chars, filename);
      } else if (option == 'w') {
        printf("%d %s\n", words, filename);
      } else if (option == 'l') {
        printf("%d %s\n", lines, filename);
      } else {
        printf("%d %d %d %s\n", lines, words, chars, filename);
      }

      close(fd);
      return 0;
    }
  }

  for (int i = startIndex; i < argc; ++i) {
    int status;
    wait(&status);
  }

  return 0;
}
