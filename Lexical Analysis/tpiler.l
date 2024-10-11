%{
    #include <stdio.h>
    #include <string.h>
    #include <ctype.h>

    int col = 1;
    int row = 1;
    int error = 0;
    char buffer[1024];
    int buffer_index = 0;
    int last_token = 0;
    
    #define YY_USER_ACTION do { \
        for (int i = 0; i < yyleng; i++) { \
            if (yytext[i] == '\n') { \
                row++; col = 1; \
                if (last_token) { \
                    printf("SEMICOLON\n"); \
                    last_token = 0; \
                } \
            } else \
                { col++; } \
            } \
    } while(0);

    void append_to_buffer(const char *text, int length) {
        strncpy(&buffer[buffer_index], text, length);
        buffer_index += length;
    }

    char * to_upper_case(char *text, int length) {
        for (int i = 0; i < length; i++) {
            text[i] = toupper(text[i]);
        }
        return text;
    }   

    //lex gocompiler.l && cc lex.yy.c -o gocompiler && ./gocompiler -l < tests/factorial.dgo > tests/factorial_out.txt
    /*TODO: 
        -> fazer a cena que está no primeiro paragrafo da pagina 6 do enunciado
        -> comments/strings states (ficha 2)
    */
%}

RESERVED "break"|"case"|"chan"|"const"|"continue"|"default"|"defer"|"fallthrough"|"go"|"goto"|"import"|"interface"|"map"|"range"|"select"|"struct"|"switch"|"type"|"--"|"++"
AND      "&&"
ASSIGN   "="
BLANKID  "_"
BOOL     "bool"
CMDARGS  "os.Args"
COMMA    ","
DIGIT    [0-9]
DIV      "/"
ELSE     "else"
EQ       "=="
FLOAT32  "float32"
FOR      "for"
FUNC     "func"
GE       ">="
GT       ">"
IF       "if"
INT      "int"
LBRACE   "{"
LE       "<="
LPAR     "("
LSQ      "["
LT       "<"
MINUS    "-"
MOD      "%"
NE       "!="
NOT      "!"
OR       "||"
PACKAGE     "package"
PARSEINT "strconv.Atoi"
PLUS     "+"
PRINT    "fmt.Println"
RBRACE   "}"
RETURN   "return"
RPAR     ")"
RSQ      "]"
SEMICOLON ";"
STAR     "*"
STRING   "string"
VAR      "var"
WHITESPACE [ \t\n\r]
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
NATURAL {DIGIT}+|0[0-7]*|0[xX][0-9a-fA-F]+
DECIMAL {DIGIT}+"."{DIGIT}+([eE][+-]?{DIGIT}+)?
STRLIT  \"([^"\\\n]|\\[fnrt\\\"])*\"

%X STRING
%X ML_COMMENT
%X SL_COMMENT

%%

"/*"    { BEGIN(ML_COMMENT); last_token = 0; }
<ML_COMMENT>"*/" { BEGIN(INITIAL); last_token = 0; }
<ML_COMMENT><<EOF>> { printf("Line %d, column %d: unterminated comment\n", row, col); error = 1; BEGIN(INITIAL); last_token = 0; }
<ML_COMMENT>\n  {last_token = 0; }
<ML_COMMENT>.   {/*printf("ML_COMMENT\n");*/last_token = 0; }

"//"    { BEGIN(SL_COMMENT); last_token = 0; }
<SL_COMMENT>\n  { BEGIN(INITIAL); last_token = 0; }
<SL_COMMENT>.   {/*printf("SL_COMMENT\n");*/last_token = 0; }

{AND}    { printf("AND\n"); last_token = 0;}
{ASSIGN} { printf("ASSIGN\n"); last_token = 0;}
{BLANKID} { printf("BLANKID\n"); last_token = 0;}
{BOOL}   { printf("BOOL\n"); last_token = 0;}
{CMDARGS} { printf("CMDARGS\n"); last_token = 0;}
{COMMA}  { printf("COMMA\n"); last_token = 0;}
{DIGIT}  { printf("DIGIT\n"); last_token = 0;}
{DIV}    { printf("DIV\n"); last_token = 0;}
{ELSE}   { printf("ELSE\n"); last_token = 0;}
{EQ}     { printf("EQ\n"); last_token = 0;}
{FLOAT32} { printf("FLOAT32\n"); last_token = 0;}
{FOR}    { printf("FOR\n"); last_token = 0;}
{FUNC}   { printf("FUNC\n"); last_token = 0;}
{GE}     { printf("GE\n"); last_token = 0;}
{GT}     { printf("GT\n"); last_token = 0;}
{IF}     { printf("IF\n"); last_token = 0;}
{INT}    { printf("INT\n"); last_token = 0;}
{LBRACE} { printf("LBRACE\n"); last_token = 0;}
{LE}     { printf("LE\n"); last_token = 0;}
{LPAR}   { printf("LPAR\n"); last_token = 0;}
{LSQ}    { printf("LSQ\n"); last_token = 0;}
{LT}     { printf("LT\n"); last_token = 0;}
{MINUS}  { printf("MINUS\n"); last_token = 0;}
{MOD}    { printf("MOD\n"); last_token = 0;}
{NE}     { printf("NE\n"); last_token = 0;}
{NOT}    { printf("NOT\n"); last_token = 0;}
{OR}     { printf("OR\n"); last_token = 0;}
{PACKAGE} { printf("PACKAGE\n"); last_token = 0;}
{PARSEINT} { printf("PARSEINT\n"); last_token = 0;}
{PLUS}   { printf("PLUS\n"); last_token = 0;}
{PRINT}  { printf("PRINT\n"); last_token = 0;}
{RBRACE} { printf("RBRACE\n"); last_token = 1;}
{RETURN} { printf("RETURN\n"); last_token = 1;}
{RPAR}   { printf("RPAR\n"); last_token = 1;}
{RSQ}    { printf("RSQ\n"); last_token = 1;}
{SEMICOLON} { printf("SEMICOLON\n"); last_token = 0;}
{STAR}   { printf("STAR\n"); last_token = 0;}
{STRING} { printf("STRING\n"); last_token = 0;}
{VAR}    { printf("VAR\n"); last_token = 0;}

{RESERVED} { printf("RESERVED(%s)\n", yytext); last_token = 0;}
{IDENTIFIER} { printf("IDENTIFIER(%s)\n", yytext); last_token = 1;}
{NATURAL} { printf("NATURAL(%s)\n", yytext); last_token = 1; }
{DECIMAL} { printf("DECIMAL(%s)\n", yytext); last_token = 1; }
{STRLIT} { printf("STRLIT(%s)\n", yytext); last_token = 1; }
{WHITESPACE} {last_token = 0; }

.   { printf("Line %d, column %d: illegal character (%s)\n", row, col-1, yytext); error = 1; last_token = 0; }


%%

extern int yylex();
int main() {
    while (!error && !feof(stdin)) {
        yylex();
    }  
    return 0;
}
int yywrap() {  
    return 1;
}