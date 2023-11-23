%{
    #include<stdio.h>
    #include<string.h>
    int un_used=0;
    int check_index;
    int symbol_table_size=30;
    struct SymbolTable{
        char lexeme[20];
        char token_type[30];
    };
    struct SymbolTable Table[30];
    int symbol_tabe_ptr=0;
    void insert_into_symbol_table(char *lexeme,char *type){
        if(symbol_tabe_ptr<symbol_table_size){
            strcpy(Table[symbol_tabe_ptr].lexeme,lexeme);
            strcpy(Table[symbol_tabe_ptr++].token_type,type);
        }
    }
    int check(char* lexeme){
        for(int i=0;i<symbol_table_size;i++){
            if(strcmp(Table[i].lexeme,lexeme)==0){
                return i;
            }
        }
        return -1;
    }
%}
%%
"#include "\s*\<[a-z|\.]*\> {
    fprintf(yyout,"%s : is a Pre-processor directive\n",yytext);
}
[ \n\t\s]+ {
    un_used++;
}
\/\/(.*) {
    un_used++;
}
\/\*(.|\n|\t)*\*\/ {
    un_used++;
}
"int"|"main"|"void"|"return"|"if"|"else"|"for"|"else if"|"break"|"while"|"char" {
    fprintf(yyout,"%s : is an Keyword\n",yytext);
    check_index=check(yytext);
    if(check_index==-1){
        insert_into_symbol_table(yytext,"Keyword");
    }
} 
[a-z][a-zA-Z0-9]* {
    fprintf(yyout,"%s : is a Identifier\n",yytext);
    check_index=check(yytext);
    if(check_index==-1){
        insert_into_symbol_table(yytext,"Identifier");
    }
}
[0-9]+ {
    fprintf(yyout,"%s : is an Integer\n",yytext);
    check_index=check(yytext);
    if(check_index==-1){
        insert_into_symbol_table(yytext,"Integer");
    }
}
"<"|">"|"<="|"<="|"=="|"!=" {
    fprintf(yyout,"%s : is an Relational Operator\n",yytext);
    check_index=check(yytext);
    if(check_index==-1){
        insert_into_symbol_table(yytext,"Relational Operator");
    }
} 
"("|")"|"{"|"}"|";"|"," {
    fprintf(yyout,"%s : is a Delimiter\n",yytext);
    check_index=check(yytext);
    if(check_index==-1){
        insert_into_symbol_table(yytext,"Delimiter");
    }
}
"="|"+="|"-="|"*="|"/=" {
    fprintf(yyout,"%s is an Assignment Operator\n",yytext);
    check_index=check(yytext);
    if(check_index==-1){
        insert_into_symbol_table(yytext,"Assignment Operator");
    }
}
"*"|"-"|"/"|"%"|"+" {
    fprintf(yyout,"%s is an Arithmetic Operator\n",yytext);
    check_index=check(yytext);
    if(check_index==-1){
        insert_into_symbol_table(yytext,"Arithhmetic Operator");
    }
}
.     {
    fprintf(yyout,"%s",yytext);
}
%%
int yywrap(){return 1;}
int main(){
    extern FILE *yyin,*yyout;
    char *input_file;
    char *output_file;
    yyin=fopen("input.c","r");
    yyout=fopen("output.txt","w");
    if (!yyin||!yyout){
        printf("Can not open files.\n");
        return 1;
    }
    yylex();
    printf("Contents of symbol table\n");
    for(int i=0;i<symbol_tabe_ptr;i++){
        printf("%s : %s\n",Table[i].lexeme,Table[i].token_type);
    }
    return 0;
}