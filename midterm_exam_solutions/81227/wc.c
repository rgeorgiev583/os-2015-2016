#include <stdio.h>

int main(int argc, char* argv) { 
    int characters = 0;
    int words = 0;
    int lines = 0;

    if (argc < 2) { exit (99); }
    else { 
        for(int i = 1; i < argc; i++) { 
	    FILE *f = fopen(argv[i], "r");
	    char c;
	    while(read(f, &c, 1)) { 
	    	if (c == "/n") { 
	            words++;
				lines++;
		}

		if (c == " ") {
		    words++;
		}

		characters++;
	    }

	    fclose(f);
	}
    }
    printf("%u characters, %u words, %u lines", characters, words, lines);
}
