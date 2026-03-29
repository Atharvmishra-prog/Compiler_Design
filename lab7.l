%{
#include <stdio.h>
%}
%%
"//".* { /* remove single-line comment */ }
\/\*([^*]|\*+[^*/])*\*+\/ { /* remove multi-line comment */ }
.|\n { ECHO; }
%%
int main(int argc,char *argv[]) {
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