%{
  #include <stdio.h>
  #include <stdlib.h>
%}

%union {
  int num;
}

%token NUM

%type <num> exp subexp muldiv terminal NUM

%%

exp: subexp '\n' { printf("= %d\n", $1); }
   |exp subexp '\n' { printf("= %d\n", $2); };

subexp: muldiv
   | subexp '+' muldiv { $$ = $1 + $3; }
   | subexp '-' muldiv { $$ = $1 - $3; };

muldiv: terminal
      | muldiv '*' terminal { $$ = $1 * $3; }
      | muldiv '/' terminal { 
                if ($3 != 0) { $$ = $1 / $3; }
		else { fprintf(stderr, "Error: Division by zero\n"); exit(EXIT_FAILURE);
		 }
		 };
terminal: NUM { $$ = $1; };
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    exit(EXIT_FAILURE);
}

int main()
{
 yyparse();
 return 0;
}