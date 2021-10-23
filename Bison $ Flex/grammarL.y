%{
	#include <ctype.h>
	#include <stdio.h>
	
	extern int yylex();
	void yyerror(char *msg);	
%}

%token NOT
%token OR
%token AND
%token BOOLEAN

%%

bexprP 	: 	bexprP bexpr '\n' {if ($2 != 0){ printf("true(1)\n");} else{ printf("false(0)\n");}}
		| 	bexprP '\n'
		|	/* empty*/ 
		;
	
bexpr	: 	bexpr OR bterm 	{ $$ = $1 || $3 }
		| 	bterm;
		
bterm 	:	bterm AND bfactor	{ $$ = $1 && $3 }
		| 	bfactor;
		
bfactor	:	NOT bfactor		{ $$ = !$2 }
		|	'(' bexpr ')' 	{ $$ = $2 }
		|   BOOLEAN;	
%%

#include "lex.yy.c"

void yyerror(char *msg)
{
	printf("Error de Sintaxis");
	exit(0);
}
main ()
{
	yyparse();
	return 0;
}