%{
#include<stdio.h>
#include <ncurses.h>
%}

%%
[0-9]*000 {printf("Accepted: %s\n",yytext);}
[0-9]* {printf("Not Accepted: %s\n",yytext);}
.|\n
%%
int yywrap(void){
return 1;
}
int main()
{
printf("Enter the string:");
yylex();
return 0;
}
