%{
#include "lalr.tab.h"
%}

%%

d { yylval.str = strdup(yytext); return NUM; }
[-+/*()\n] { return *yytext; }
[ \t] ;
. { fprintf(stderr, "Invalid character: %s\n", yytext); }

%%

int yywrap()
{
return 1;
}