CFILES = memory.c names.c news.c interp.c tty.c primitive.c filein.c lex.c parser.c unixio.c

CFLAGS=-O0 -g

all: st

# st - the actual bytecode interpreter
st:
	gcc -o st $(CFLAGS) $(CFILES) st.c $(INTERFACE) -lm $(LIBS)

image: st
	./st stlib/*

clean:
	-rm -f *.o
	-rm st systemImage
