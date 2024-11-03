%{
/*
    Authors:
        Nuno Batista: uc2022216127
        Miguel Castela: uc2022212972
*/
#include "ast.h"

int yylex(void);
void yyerror(char*);

struct node *program;

%}

%union{
    char *lexeme;
    struct node *node;
}

%token              SEMICOLON COMMA STAR DIV MINUS PLUS EQ GE GT LBRACE LE LPAR LSQ LT 
                    MOD NE NOT AND OR PACKAGE ELSE FOR IF VAR INT FLOAT32 BOOL STRING PRINT PARSEINT 
                    FUNC CMDARGS BLANKID RBRACE RPAR RETURN RSQ ASSIGN
%token  <lexeme>    STRLIT RESERVED IDENTIFIER NATURAL DECIMAL
%type   <node>      Program VarDecl FuncDecl FuncHeader FuncBody ParamDecl  

%left   LOW
%left   COMMA
%right  ASSIGN
%left   OR
%left   AND
%left   EQ NE
%left   LT GT LE GE
%left   PLUS MINUS
%left   STAR DIV MOD
%right  NOT



%%

Program: {;}  
    ;


%%

// all needed functions are collected in the .l and ast.* files
