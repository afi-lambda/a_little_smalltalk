CFILES = st.cpp memory.cpp names.cpp news.cpp interp.cpp tty.cpp primitive.cpp filein.cpp lex.cpp parser.cpp unixio.cpp

CFLAGS=-O0 -g3 -Wall -std=c++0x -I/usr/include/c++/4.6/i686-linux-gnu -I/usr/include/c++/4.6

all: image

lsti:
	g++ -o $@ $(CFLAGS) $(addprefix src/, $(CFILES)) -lm

image: lsti
	@echo Creating initial image . . .
	./lsti stlib/*

format:
	cd src && astyle -A1 *

clean:
	@-rm -f *.o 2>/dev/null
	@-rm lsti 2>/dev/null
	
