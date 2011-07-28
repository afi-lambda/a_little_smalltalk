INTERPc = memory.c names.c news.c interp.c tty.c
INTERPo = memory.o names.o news.o interp.o
PRIMITIVEc = primitive.c filein.c lex.c parser.c unixio.c
PRIMITIVEo = primitive.o filein.o lex.o parser.o unixio.o
basicST = basic.st mag.st collect.st 
unixST = file.st mult.st 
testST = test.st queen.st
CFILES = *.h $(INTERPc) $(PRIMITIVEc) st.c initial.c tty.c winprim.c
OFILES = $(INTERPo) $(PRIMITIVEo) 
STFILES = $(basicST) $(unixST) $(testST) tty.st graphics.st stdwin.st
FILES = README Makefile vms.com $(CFILES) $(STFILES) *.ms
# the following are used only by turboc on the ibm pc
TURBOc=memory names news interp primitive filein lex parser unixio tty
CFLAGS=-O0 -g

all: initial st

# initial - the initial object maker
initial:
	gcc -o initial $(CFLAGS) $(INTERPc) $(PRIMITIVEc) initial.c $(INTERFACE) -lm $(LIBS)

# st - the actual bytecode interpreter
st:
	gcc -o st $(CFLAGS) $(INTERPc) $(PRIMITIVEc) st.c $(INTERFACE) -lm $(LIBS)

clean:
	-rm -f *.o
	-rm initial st