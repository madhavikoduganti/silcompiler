%{
	#include<stdio.h>
	#include "y.tab.h"
	#include<stdlib.h>	
%}
number 	[0-9]+
ws		[ \n\t]+
plus 	\+
pdt		\*
minus	\-
div		\/
lt		\<
gt		\>
eq		"=="
id		[a-z]([0-9]|[a-z])*
delim	";"
asgn	"="
rd		read
wt		write
cif		"if"
then		"then"
celse	"else"
cendif	"endif"
cwhile	"while"
cdo		"do"
cendw	"endwhile"
and 		"AND"
or 		"OR"
not		"NOT"
%%
"&"				return AMPD;
"!="				return NEQ;
"<="				return LE;
">="				return GE;
"["				return *yytext;
"]"				return *yytext;
"decl"			{return DECL;}
"enddecl"		{return ENDDECL;}
"integer"			{return INT;}
"boolean"		{return BOOL;}
"TRUE"			{yylval.n=CTRUE;return ABOOL;}
"FALSE"			{yylval.n=CFALSE;return ABOOL;}
"begin"			return PBEGIN;
"end"			return PEND;
","				{return COMMA;}
{ws}			;
{cwhile}			{return WHILE;}
{cdo}			{return DO;}
{cendw}			{return ENDWHILE;}
{cif}				{return IF;}
{then}			{return THEN;}
{celse}			{return ELSE;}
{cendif}			{return ENDIF;}
{rd}				{return READ;}
{wt}				{return WRITE;}
{asgn}			{return ASGN;}
{delim}			{return DELIM;}
{id}				{yylval.ch=strdup(yytext);return ID;}
{div}			{return DIV;}
{minus}			{return MINUS;}
{plus}			{return PLUS;}
{pdt}			{return PDT;}
"%"				{return  MOD;}
{number}			{yylval.n=atoi(yytext);return NUM;}
[()]				return *yytext;
{lt}				return LT;
{gt}				return GT;
{eq}				return EQ;
{and}			return AND;
{or}				return OR;
{not}			return NOT;
.				{printf("invalid character: %c\n",*yytext);return 0;}

%%


