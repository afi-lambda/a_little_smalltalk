CFILES = st.c memory.c names.c news.c interp.c tty.c primitive.c filein.c lex.c parser.c unixio.c

CFLAGS=-O0 -g3 -Wall -I/usr/include/c++/4.6/i686-linux-gnu -I/usr/include/c++/4.6

all: image

lsti:
	g++ -o $@ $(CFLAGS) $(addprefix src/, $(CFILES)) -lm

image: lsti
	@echo Creating initial image . . .
	./lsti stlib/*

clean:
	@-rm -f *.o 2>/dev/null
	@-rm lsti 2>/dev/null
	
