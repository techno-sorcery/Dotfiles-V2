CC = gcc
CFLAGS = -Wall -std=c99 -pedantic -g
MAIN = technobar
OBJS = technobar.o

all : $(MAIN)

$(MAIN) : $(OBJS) config.h
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJS)

technobar.o : technobar.c config.h
	$(CC) $(CFLAGS) -c technobar.c

clean :
	rm *.o $(MAIN) core
