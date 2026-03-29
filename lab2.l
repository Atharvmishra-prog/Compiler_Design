%{ 
#include<stdio.h> 
%} 

%% 
"int"|"float"|"char"|"double"|"if"|"else"|"for"|"do"|"while" 	{printf("\nKeyword: %s",yytext);} 
[0-9@!#]+[a-zA-Z_][a-zA-Z0-9_]* 	{printf("\nInvalid Identifiers: %s",yytext);} 
[a-zA-Z_][a-zA-Z0-9_]* 		{printf("\nIdentifiers: %s",yytext);} 
%% 

int main(int argc, char* argv[]){ 
printf("\nAtharv Mishra  ML1 16\n"); 
extern FILE *yyin; 
yyin = fopen(argv[1],"r"); 
yylex(); 
return 0; 
} 

int yywrap(){ 
return 1; 
} 