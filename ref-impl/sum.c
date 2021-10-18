#include <stdio.h>
#include <stdlib.h>
#include "parse.h"

int main (int argc, const char* argv[])
{
    // parse and set program arguments
    if (argc < 2) {
        printf("too few arguments\n");
        return EXIT_FAILURE;
    }
    int sum = 0;
    while (*++argv) {
	    // sum up command line arguments
	    int32_t num = 0;
	    if (!tryParseNumber(*argv, &num)) {
	      printf("invalid number '%s'", *argv);
              return EXIT_FAILURE;
	    }
	    sum = sum + num;
    }

    printf("%d\n", sum);
}
