CFILES = st.c memory.c names.c news.c interp.c tty.c primitive.c filein.c lex.c parser.c unixio.c

CFLAGS=-O0 -g

all: lsti

lsti:
	gcc -o $@ $(CFLAGS) $(CFILES) -lm

image: lsti
	./lsti stlib/*

clean:
	@-rm -f *.o 2>/dev/null
	@-rm lsti systemImage 2>/dev/null
