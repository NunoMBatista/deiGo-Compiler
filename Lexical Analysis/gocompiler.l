%{
    #include <ctype.h>
    #include <stdio.h>
    #include <string.h>

    char* to_uppercase(char* str) {
        for (int i = 0; str[i] != '\0'; i++) {
            str[i] = toupper(str[i]);
        }
        return str;
    }
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

IGNORE      " "|"\n"|"\t"
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
DECIMAL     [{NATURAL}("."{DECLIT}+)?({EXPONENT})?]

%%

{SEMICOLON}         { printf("SEMICOLON\n"); }
{BLANKID}           { printf("BLANKID\n"); }
{RESERVED}          { printf("%s\n", to_uppercase(yytext)); }

{IDENTIFIER}        { printf("IDENTIFIER(%s)\n", yytext); }
{NATURAL}           { printf("NATURAL(%s)\n", yytext); }

%%

extern int yylex();
int main() {
    yylex();    /* run the lexical analysis automaton */
    return 0;
}
int yywrap() {  /* called on EOF, return 1 to terminate */
    return 1;
}