/*%{
#define NOT 20
#define OR 21 
#define AND 22
#define BOOLEAN 23

%}*/

And [Aa][Nn][Dd] 
Or [Oo][Rr] 
Not [Nn][Oo][Tt]
True [Tt][Rr][Uu][Ee]
False [Ff][Aa][Ll][Ss][Ee]

%% 
[ \t] ; 	{/*Espacios en Blanco*/}
{False} {yylval = 0; return BOOLEAN;};
		
{True} 	{yylval = 1; return BOOLEAN;};
		
{And} 	return AND;
{Or} 	return OR;
{Not} 	return NOT;
[()\n]	return yytext[0];
.			printf("Error\n");
%%

int yywrap(void)
{
	return 0;
}

/*main(){
	int token;
	token = yylex();
	while (token){
		printf("%d\n", token);
		token = yylex();
	}
}*/ 