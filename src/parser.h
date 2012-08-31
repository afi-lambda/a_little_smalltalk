/* 
 * File:   parser.h
 * Author: oni
 *
 * Created on 31. August 2012, 21:05
 */

#ifndef PARSER_H
#define	PARSER_H

void setInstanceVariables(object aClass);

static void genCode(int value);

static void genInstruction(int high, int low);

static int genLiteral(object aLiteral);

/* generate an integer push */
static void genInteger(int val);

static boolean nameTerm(char *name);

static int parseArray();

static boolean term();

static void parsePrimitive();

static void genMessage(boolean toSuper, int argumentCount, object messagesym);

static boolean unaryContinuation(boolean superReceiver);

static boolean binaryContinuation(boolean superReceiver);

static int optimizeBlock(int instruction, boolean dopop);

static boolean keyContinuation(boolean superReceiver);

static void continuation(boolean superReceiver);

static void expression();

static void assignment(char *name);

static void statement();

static void body();

static void block();

static void temporaries();

static void messagePattern();

boolean parse(object method, const char *text, boolean savetext);

#endif	/* PARSER_H */

