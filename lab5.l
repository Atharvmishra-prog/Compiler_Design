%{ 
#include <stdio.h> 
#include <stdlib.h> 
int characters = 0; 
int words = 0; 
int whitespaces = 0; 
int lines = 0; 
%} 

%% 
\n              { lines++; characters++; } 
[ \t]+          { whitespaces += yyleng; characters += yyleng; } 
[^ \t\n]+       { words++; characters += yyleng; } 
%% 

int main() 

{ 

    FILE *file = fopen("input.txt", "r"); 
    if (!file) 
    { 
        printf("Could not open input.txt\n"); 
        return 1; 
    } 
    yyin = file; 
    yylex(); 
    printf("\nTotal Characters  : %d\n", characters); 
    printf("Total Words       : %d\n", words); 
    printf("Total Whitespaces : %d\n", whitespaces); 
    printf("Total Lines       : %d\n", lines); 
    fclose(file); 
    return 0; 

} 
int yywrap() 

{ 
    return 1; 
} 