%{
	#include<stdio.h>
	int count=0;
%}

%%

\n {count++;}
.|\\n 
%%
int yywrap(void){ return 1;}
int main()
{
	printf("Enter Sentences: ");
	yylex();
	printf("Number of lines: %d\n",count);
	return 0;
}

