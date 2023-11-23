%{
	#include<stdio.h>
	int vow=0;
	int con=0;
%}

%%
[aeiouAEIOU] {vow++;}
[a-zA-Z] {con++;}
%%
int yywrap(){}
int main()
{
	printf("Enter String: ");
	yylex();
	printf("Number of vowels: %d\n",vow);
	printf("Number of vowels: %d\n",con);
	return 0;
}

