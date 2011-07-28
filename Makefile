CFILES = memory.c names.c news.c interp.c tty.c primitive.c filein.c lex.c parser.c unixio.c

CFLAGS=-O0 -g

all: initial st

# initial - the initial object maker
initial:
	gcc -o initial $(CFLAGS) $(CFILES) initial.c $(INTERFACE) -lm $(LIBS)

# st - the actual bytecode interpreter
st:
	gcc -o st $(CFLAGS) $(CFILES) st.c $(INTERFACE) -lm $(LIBS)

image: initial
	./initial stlib/*

clean:
	-rm -f *.o
	-rm initial st systemImage
