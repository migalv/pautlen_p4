CC = gcc -ansi -pedantic -g
CFLAGS = -Wall

all: pruebaSintactico

pruebaSintactico: y.tab.o lex.yy.o prueba_sintactico.o y.tab.o y.tab.h
	$(CC) $(CFLAGS) -o $@ prueba_sintactico.o lex.yy.o y.tab.o

lex.yy.c: alfa.l
	flex alfa.l

y.tab.c: alfa.y
	bison -dyv alfa.y

lex.yy.o: lex.yy.c y.tab.h
	$(CC) -c lex.yy.c

y.tab.o: y.tab.c y.tab.h
	$(CC) -c y.tab.c

prueba_sintactico.o: prueba_sintactico.c y.tab.h
	$(CC) -c prueba_sintactico.c

clean:
	rm *.o lex.yy.c y.tab.c y.tab.h pruebaSintactico
