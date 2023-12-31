%{
#include "calc.tab.h"
%}

%%
{
[0-9]+ { yylval.num=atoi(yytext); return NUM; }
[-+*/\n] { return *yytext; }
[ \t] ;
. { fprintf(stderr, "Invalid character: %s\n", yytext); }

}

%%

int yywrap()
{
return 1;
}