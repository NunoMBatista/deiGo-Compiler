%{
    #include <ctype.h>
    #include <stdio.h>
    #include <string.h>

    #define YY_USER_ACTION curcol += yyleng;


    int line = 1; 
    int curcol = 1; 
%}

SEMICOLON   ";"
COMMA       ","
BLANKID     "_"
ASSIGN      "="
STAR        "*"
DIV         "/"
MINUS       "-"
PLUS        "+"
EQ          "=="
GE          ">="
GT          ">"
LBRACE      "{"
LE          "<="
LPAR        "("
LSQ         "["
LT          "<"
MOD         "%"
NE          "!="
NOT         "!"
AND         "&&"
OR          "||"
RBRACE      "}"
RSQ         "]"
PACKAGE     "package"
RETURN      "return"
ELSE        "else"
FOR         "for"
IF          "if"
VAR         "var"
INT         "int"
FLOAT32     "float32"
BOOL        "bool"
STRING      "string"
PRINT       "fmt.Println"
PARSEINT    "strconv.Atoi"
FUNC        "func"
CMDARGS     "os.Args"
RESERVED    "++"|"--"|"break"|"case"|"chan"|"const"|"continue"|"default"|"defer"|"fallthrough"|"go"|"goto"|"import"|"interface"|"map"|"range"|"select"|"struct"|"switch"|"type"

IGNORE      " "|"\t"
NEWLINE     "\n"|"\r"|"\r\n"


LETTER       [a-z]|[A-Z]|"_"
DECLIT       [0-9]
OCTALPREFIX  "0"
OCTAL        [0-7]
HEX          [0-9a-fA-F]+
HEXPREFIX    "0x"|"0X"

IDENTIFIER  {LETTER}({DECLIT}|{LETTER})*
NATURAL     ({DECLIT}+)|({OCTALPREFIX}{OCTAL}+)|({HEXPREFIX}{HEX}+)

EXPONENT    [eE][+-]?{DECLIT}+
DECIMAL     ({DECLIT}+"."{DECLIT}*{EXPONENT}?)|("."{DECLIT}+{EXPONENT}?)|({DECLIT}+{EXPONENT})

%X SINGLE_LINE_COMMENT
%X MULTI_LINE_COMMENT

%%

"//"                                { BEGIN SINGLE_LINE_COMMENT; }
<SINGLE_LINE_COMMENT>.              { ; }
<SINGLE_LINE_COMMENT>{NEWLINE}      { BEGIN INITIAL; }


{SEMICOLON}                         { printf("SEMICOLON\n"); }
{COMMA}                             { printf("COMMA\n"); }
{ASSIGN}                            { printf("ASSIGN\n"); }
{STAR}                              { printf("STAR\n"); }
{DIV}                               { printf("DIV\n"); }
{MINUS}                             { printf("MINUS\n"); }
{PLUS}                              { printf("PLUS\n"); }
{EQ}                                { printf("EQ\n"); }
{GE}                                { printf("GE\n"); }
{GT}                                { printf("GT\n"); }
{LBRACE}                            { printf("LBRACE\n"); }
{LE}                                { printf("LE\n"); }
{LPAR}                              { printf("LPAR\n"); }
{LSQ}                               { printf("LSQ\n"); }
{LT}                                { printf("LT\n"); }
{MOD}                               { printf("MOD\n"); }
{NE}                                { printf("NE\n"); }
{NOT}                               { printf("NOT\n"); }
{AND}                               { printf("AND\n"); }
{OR}                                { printf("OR\n"); }
{RBRACE}                            { printf("RBRACE\n"); }
{RSQ}                               { printf("RSQ\n"); }
{PACKAGE}                           { printf("PACKAGE\n"); }
{RETURN}                            { printf("RETURN\n"); }
{ELSE}                              { printf("ELSE\n"); }
{FOR}                               { printf("FOR\n"); }
{IF}                                { printf("IF\n"); }
{VAR}                               { printf("VAR\n"); }
{INT}                               { printf("INT\n"); }
{FLOAT32}                           { printf("FLOAT32\n"); }
{BOOL}                              { printf("BOOL\n"); }
{STRING}                            { printf("STRING\n"); }
{PRINT}                             { printf("PRINT\n"); }
{PARSEINT}                          { printf("PARSEINT\n"); }
{FUNC}                              { printf("FUNC\n"); }
{CMDARGS}                           { printf("CMDARGS\n"); }
{IGNORE}                            { ; }
{NEWLINE}                           { line++; curcol = 1; }

{BLANKID}                           { printf("BLANKID\n"); }
{RESERVED}                          { printf("%s\n", yytext); }

{IDENTIFIER}                        { printf("IDENTIFIER(%s)\n", yytext); }
{NATURAL}                           { printf("NATURAL(%s)\n", yytext); }
{DECIMAL}                           { printf("DECIMAL(%s)\n", yytext); }

%%

extern int yylex();
int main() {
    yylex();    /* run the lexical analysis automaton */
    return 0;
}
int yywrap() {  /* called on EOF, return 1 to terminate */
    return 1;
}