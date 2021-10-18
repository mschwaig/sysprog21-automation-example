all: sum

cleansum:
	rm -f sum

clean: cleansum

sum: sum.c parse.h
	gcc -o sum sum.c parse.h -g -std=c17 -Wall

