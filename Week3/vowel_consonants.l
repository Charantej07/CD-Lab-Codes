%{
	#include<stdio.h>
%}

%%
[aeiouAEIOU] {printf("vowel\n");}
[a-zA-Z] {printf("Consonant\n");}
%%
int yywrap(){return 1;}
int main()
{
	printf("Enter String: ");
	yylex();
	return 0;
}

