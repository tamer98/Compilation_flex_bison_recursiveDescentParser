CC = gcc
objects = flights.o lex.yy.o  

flights: $(objects)
	$(CC) -o flights $(objects)


lex.yy.o : lex.yy.c flights.h
	$(CC) -c lex.yy.c

flights.o : flights.c flights.h 
	$(CC) -c flights.c
	
lex.yy.c : flights.lex
	flex flights.lex
	
clean :
	rm -f $(objects) flights  lex.yy.c
