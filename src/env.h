/*
 Little Smalltalk, version two
 Written by Tim Budd, Oregon State University, July 1987

/*=============== rules for various systems ====================*/

#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;

#define byteToInt(b) (b)

/* this is a bit sloppy - but it works */
#define longCanBeInt(l) ((l >= -16383) && (l <= 16383))

#define STRINGS
#define SIGNAL

/* ======== various defines that should work on all systems ==== */

# define streq(a,b) (strcmp(a,b) == 0)

# define true 1
# define false 0

/* define the datatype boolean */
typedef int boolean;

# define X ,
# define OBJ object
# define OBJP object *
# define INT int
# define BOOL boolean
# define STR char *
# define FLOAT double
# define NOARGS void
# define FILEP FILE *
# define FUNC ()
