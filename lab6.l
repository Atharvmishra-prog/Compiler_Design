%{
#include<stdio.h>
%}
 
%%
[ \t\n]+ {fputc(' ',yyout);}
. {fputc(yytext[0],yyout);}
%%
 
int main(int argc,char* argv[]){
  extern FILE* yyin;
  extern FILE* yyout;
  yyin=fopen(argv[1],"r");
  yyout=fopen(argv[2],"w");
  yylex();
  fclose(yyin);
  fclose(yyout);
  return 0;
 }
 
int yywrap(){
 return 1;
 }