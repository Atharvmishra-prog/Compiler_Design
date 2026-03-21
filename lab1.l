%{
#include<stdio.h>
%}

%%
"-"?[0-9]+                 {printf("Integer: %s\n",yytext);}
"-"?[0-9]+"."[0-9]+        {printf("Float: %s\n",yytext);}
"-"?[0-9]+("."[0-9]+)?[eE][+-]?[0-9]+   {printf("Exponential: %s\n",yytext);}
[ \t\n]+ ;
. ;
%%

int main(int argc, char* argv[])
{
    extern FILE *yyin;
    yyin = fopen(argv[1],"r"); // For files
    yyin=stdin;  //For input 
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}