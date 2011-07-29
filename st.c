/*
 Little Smalltalk, version 3
 Main Driver
 written By Tim Budd, September 1988
 Oregon State University
 */
# include <stdio.h>
# include "env.h"
# include "memory.h"
# include "names.h"

int initial = 0; /* not making initial image */

extern int objectCount();

main(int argc, char **argv)
{
	FILE *fp;
	object firstProcess;
	char *p, buffer[120];

	initMemoryManager();

	strcpy(buffer, "systemImage");
	p = buffer;

	if (argc != 1)
		p = argv[1];

	fp = fopen(p, "rb");

	if (fp == NULL) {
		sysError("cannot open image", p);
		exit(1);
	}
	imageRead(fp);
	initCommonSymbols();

	firstProcess = globalSymbol("systemProcess");
	if (firstProcess == nilobj) {
		sysError("no initial process", "in image");
		exit(1);
		return 1;
	}

	/* execute the main system process loop repeatedly */
	/*debugging = true;*/

	/* not using windowing interface, safe to print out message */
	printf("Little Smalltalk, Version 3.04\n");
	printf("Written by Tim Budd, Oregon State University\n");

	while (execute(firstProcess, 15000))
		;

	/* exit and return - belt and suspenders, but it keeps lint happy */
	exit(0);
	return 0;
}
