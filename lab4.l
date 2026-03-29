%{
	#include<stdio.h>
%}

%%
"int"|"float"|"while"|"if"|"else"		{ printf("keyword	:%s\n", yytext);}
[a-zA-Z_][a-zA-Z0-9_]*					{ printf("Identifier: %s\n", yytext);}
[<=|==|\+\+|=|\*]						{ printf("Operator: %s\n", yytext);}
[(),;{}]								{ printf("Separator: %s\n", yytext);}
[0-9]+(\.[0-9]+)?						{	/*Do nothing*/	}
[ \t\n]+								{	/*Ignore whitespaces*/}
.										{	/*Ignore unrecognized characters*/}
%%

int yywrap(){
	return 1;
}

int main(){
	yyin = stdin;
	yylex();
	return 0;
} 