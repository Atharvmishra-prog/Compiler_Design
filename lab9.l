%{
    #include <stdio.h>
    char str[1000];
    int l = 0;
%}

%s INV A

%%
[ab] { str[l++] = yytext[0]; }
<INV>\n {printf("rejected\n");}
<A>\n  {   if( l >= 3 && str[l-3]== 'a'){ 
            printf("accepted\n");
        }
        else{
            printf("rejected\n");
        }
        
}
. { BEGIN(INV); }
%%

int yywrap(){
    return 1;
}

int main(){
    BEGIN(A);
    yylex();
    return 0;
}