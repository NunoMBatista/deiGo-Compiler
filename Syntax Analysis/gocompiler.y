%{
/*
    Authors:
        Nuno Batista: uc2022216127
        Miguel Castela: uc2022212972
*/
#include "ast.h"
#include <stdlib.h>

int yylex(void);
void yyerror(char*);

struct node *program;

%}

%debug

%union{
    char *lexeme;
    struct node *node;
}

// Terminal symbols without associated values
%token              SEMICOLON COMMA STAR DIV MINUS PLUS EQ GE GT LBRACE LE LPAR LSQ LT 
                    MOD NE NOT AND OR PACKAGE ELSE FOR IF VAR INT FLOAT32 BOOL STRING PRINT PARSEINT 
                    FUNC CMDARGS BLANKID RBRACE RPAR RETURN RSQ ASSIGN 

// Terminal symbols with associated values
%token  <lexeme>    STRLIT RESERVED IDENTIFIER NATURAL DECIMAL

// Non-terminal symbols
%type   <node>      Program VarDecl FuncDecl FuncParams FuncBody 
//FuncHeader ParamDecl


// Aux Non-terminal symbols 
%type  <node>       Declarations VarSpec Type OptFuncParams OptType
                    VarsAndStatements Statement Expr OptElse StarStatementSc
                    OptExpr FuncInvocation ParseArgs PosExpr 

%left   LOW
%nonassoc IF ELSE FOR
%left   COMMA
%right  ASSIGN
%left   OR
%left   AND
%left   EQ NE
%left   LT GT LE GE
%left   PLUS MINUS
%left   STAR DIV MOD
%left   LBRACE RBRACE LPAR RPAR LSQ RSQ
%right  NOT 


%%

/* 
....Program(>=0)
........{VarDecl/FuncDecl}
*/
Program             :   PACKAGE IDENTIFIER SEMICOLON Declarations               
                        {
                            $$ = program = new_node(Program, NULL); 
                            add_child($$, $4);
                        }
                    ;

Declarations        :   Declarations FuncDecl SEMICOLON
                        {
                            $$ = $1;
                            add_child($$, $2);
                            //add_child($$, new_node(FuncDecl, NULL));
                        }              
                    |   Declarations VarDecl SEMICOLON
                        {
                            $$ = $1;
                            add_child($$, $2);
                            //add_child($$, new_node(VarDecl, NULL));
                        }
                    |   
                        {
                            $$ = new_node(AUX, NULL);
                        }
                    ;


/*
....VarDecl(1)
........<typespec>
........Identifier
*/
VarDecl             :   VAR VarSpec                                             
                        {
                            $$ = new_node(AUX, NULL);
                            add_child($$, $2);
                        }
                    |   VAR LPAR VarSpec SEMICOLON RPAR                         
                        {
                            $$ = new_node(AUX, NULL);
                            add_child($$, $3);
                        }
                    ;   

VarSpec             :   IDENTIFIER Type
                        {
                            $$ = new_node(VarDecl, NULL);
                            add_child($$, $2);
                            add_child($$, new_node(Identifier, $1));
                        }
                    |   IDENTIFIER COMMA VarSpec                                
                        {
                            $$ = new_node(VarDecl, NULL);
                            add_child($$, $3);
                            add_child($$, new_node(Identifier, $1));

                        }
                        
                    ;

/*
LEAF NODES: INT, FLOAT32, BOOL, STRING
*/
Type                :   INT                                                     
                        {
                            $$ = new_node(Int, NULL);
                        }
                    |   FLOAT32                                                 
                        {
                            $$ = new_node(Float32, NULL);    
                        }
                    |   BOOL                                                    
                        {
                            $$ = new_node(Bool, NULL);
                        }
                    |   STRING                                                  
                        {
                            $$ = new_node(String, NULL);
                        }
                    ;

/* 
....FuncDecl(2) 
........FuncHeader(>=2)
............Identifier
............<typespec>
............FuncParams
................|SPECIFIED BELOW|
........FuncBody(>=0)
............|SPECIFIED BELOW|
*/
FuncDecl            :   FUNC IDENTIFIER LPAR OptFuncParams RPAR OptType FuncBody
                        {
                            $$ = new_node(FuncDecl, NULL);
                            
                            struct node *new_func_header = new_node(FuncHeader, NULL);
                            add_child($$, new_func_header);
                            add_child(new_func_header, new_node(Identifier, $2));
                            add_child(new_func_header, $6);
                            add_child(new_func_header, $4);

                            add_child($$, $7);
                        }
                    ;

OptFuncParams       :   FuncParams                           
                        {
                            $$ = $1;
                        }                        
                    |   
                        {
                            $$ = new_node(FuncParams, NULL);
                        }                                                        
                    ; 

OptType             :   Type                                                    
                        {
                            $$ = $1;
                        }
                    |   
                        {
                            $$ = new_node(AUX, NULL);
                        }
                    ;

/*
....FuncParams(>=0)
........ParamDecl
*/
FuncParams          :   IDENTIFIER Type                                         
                        {
                            $$ = new_node(FuncParams, NULL);

                            struct node *new_param_decl = new_node(ParamDecl, NULL);
                            add_child($$, new_param_decl);
                            add_child(new_param_decl, $2);
                            add_child(new_param_decl, new_node(Identifier, $1));
                        }
                    |   FuncParams COMMA IDENTIFIER Type
                        {
                            $$ = $1;
                            
                            struct node *new_param_decl = new_node(ParamDecl, NULL);
                            add_child($$, new_param_decl);
                            add_child(new_param_decl, $4);  
                            add_child(new_param_decl, new_node(Identifier, $3));
                        }
                    ;   

/*
....FuncBody(>=0)
........<declarations>/<statements>
*/
FuncBody            :   LBRACE VarsAndStatements RBRACE                         
                        {
                            $$ = new_node(FuncBody, NULL);
                            //add_child($$, new_node(If, NULL));
                            add_child($$, $2);
                        
                        }
                    ;

VarsAndStatements   :   VarsAndStatements SEMICOLON                             
                        {
                            $$ = $1;
                        }
                    |   VarsAndStatements VarDecl SEMICOLON                     
                        {
                            $$ = $1;
                            add_child($$, $2);
                        }
                    |   VarsAndStatements Statement SEMICOLON                   
                        {
                            $$ = $1;
                            add_child($$, $2);
                        }
                    |                                                           
                        {
                            $$ = new_node(AUX, NULL);
                        } 
                    ;

/*
....Block(>=0) <- Only needed if there is more than 1 statement in the block

....If(3)

....For
........[Expr]
........Block

....Return(>=0)

....Call(>=1)

....Print(1)

....ParseArgs(2)

....Or(2) And(2) Eq(2) Ne(2) Lt(2)
....Gt(2) Le(2) Ge(2) Add(2) Sub(2) 
....Mul(2) Div(2) Mod(2) Not(1) Minus(1) 
....Plus(1) Assign(2) 

LEAF NODES: Natural, Decimal, Identifier, Strlit
*/
Statement           :   IDENTIFIER ASSIGN Expr                                  {;}
                    |   LBRACE StarStatementSc RBRACE                           {;}
                    |   IF Expr LBRACE StarStatementSc RBRACE OptElse %prec LOW {;}
                    |   FOR OptExpr LBRACE StarStatementSc RBRACE               {;}
                    |   RETURN OptExpr                                          {;}
                    |   FuncInvocation                                          {;}
                    |   ParseArgs                                               {;}
                    |   PRINT LPAR Expr RPAR                                    {;}
                    |   PRINT LPAR STRLIT RPAR                                  {;}
                    |   error                                                   {;}
                    ;

StarStatementSc     :   Statement SEMICOLON StarStatementSc                     {;}
                    |                                                           {;}
                    ;

OptElse             :   ELSE LBRACE StarStatementSc RBRACE                      {;}
                    |                                                           {;}
                    ;

OptExpr             :   Expr                                                {;}
                    |                                                       {;}
                    ;

ParseArgs           :   IDENTIFIER COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ Expr RSQ RPAR {;}
                    |   IDENTIFIER COMMA BLANKID ASSIGN PARSEINT LPAR error RPAR {;}
                    ;

FuncInvocation      :   IDENTIFIER LPAR PosExpr RPAR                            {;}
                    |   IDENTIFIER LPAR error RPAR                               {;}    
                    ;

PosExpr             :   Expr                                                    {;}
                    |   Expr COMMA PosExpr                                      {;}
                    |                                                           {;}
                    ;

Expr                :   Expr OR Expr                                            {;}
                    |   Expr AND Expr                                           {;}

                    |   Expr LT Expr                                            {;}
                    |   Expr GT Expr                                            {;}
                    |   Expr EQ Expr                                            {;}
                    |   Expr NE Expr                                            {;}
                    |   Expr LE Expr                                            {;}
                    |   Expr GE Expr                                            {;}
                    
                    |   Expr PLUS Expr                                          {;}
                    |   Expr MINUS Expr                                         {;}
                    |   Expr STAR Expr                                          {;}       
                    |   Expr DIV Expr                                           {;}
                    |   Expr MOD Expr                                           {;}

                    |   MINUS Expr              %prec NOT                       {;}
                    |   NOT Expr                %prec NOT                       {;}
                    |   PLUS Expr               %prec NOT                       {;}
                    |   NATURAL                                                 {;}
                    |   DECIMAL                                                 {;}
                    |   IDENTIFIER                                              {;}
                    |   FuncInvocation                                          {;}
                    |   LPAR Expr RPAR                                          {;}
                    |   LPAR error RPAR                                         {;}
                    ;




%%

// all needed functions are collected in the .l and ast.* files