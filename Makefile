CFILES = st.c memory.c names.c news.c interp.c tty.c primitive.c filein.c lex.c parser.c unixio.c

CFLAGS=-O0 -g3 -Wall -Werror

all: image

lsti:
	gcc -o $@ $(CFLAGS) $(addprefix src/, $(CFILES)) -lm

lsti.so:
	gcc -o $@ $(CFLAGS) $(addprefix src/, $(CFILES)) -lm  -fPIC -shared

image: lsti
	@echo Creating initial image . . .
	./lsti stlib/*

format:
	cd src && astyle -A1 *

clean:
	@-rm -f *.o 2>/dev/null
	@-rm lsti 2>/dev/null
	@-rm lsti.so 2>/dev/null
	@-rm systemImage 2>/dev/null
	
