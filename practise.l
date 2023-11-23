%{
    #include<stdio.h>
    #include<stdlib.h>
    int value;
    int sum=0;

%}


%%
[0-9]* {
    if(yyleng!=4){
        printf("Not accepted");
    }else {
        for(int i=0;i<4;i++){
            sum+=(int)yytext[i]-48;
        }
        if(sum==9){
            printf("String is accepted");
        }else {
            printf("String is not accepted");
        }
    }
}
.* {printf("String is not accepted");}
%%
int yywrap(){}
int main(){
    printf("Enter the string: ");
    yylex();
}