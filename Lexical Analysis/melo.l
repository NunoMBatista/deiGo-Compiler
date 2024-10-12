%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    int linha = 1;
    int coluna = 1;
    int linha_coluna[2]; 
    int flag = 0; //0 - imprime so erros , 1 - imprimi tudo (so acontece se for corrido com a flag -l)
    int flag_string=0; //para quando da erro a meio na string nao a imprimir
    char * strlit;
    int last_token=0; //flag para as semicolon
    #define YY_USER_ACTION {coluna+=yyleng;} 

%}
%X COMMENT_BARRAS STRLIT COMMENT_ASTERISCO


newline                 [\n|\r|\r\n]

identifier              [a-zA-Z]([a-zA-Z_]|[0-9])*|"_"([a-zA-Z_]|[0-9])+
strlit                  ([^\n\r\\"]|\\n|\\f|\\r|\\\\|\\\"|\\t)*

natural                 ("0"|[1-9][0-9]*|"0"[0-7]+|"0"("x"|"X")[0-9|A-F|a-f]+)
decimal                 ([0-9]+"."[0-9]*|[0-9]*"."[0-9]+)
decimal_expo            ([0-9]*"."?[0-9]*[eE][+-]?[0-9]*) 



semicolon               ";"
comma                   ","
blankid                 "_"
assign                  "="
star                    "*"
div                     "/"
minus                   "-"
plus                    "+"
eq                      "=="
ge                      ">="
gt                      ">"
lbrace                  "{"
le                      "<="
lpar                    "("
lsq                     "["
lt                      "<"
mod                     "%"
ne                      "!="
not                     "!"
and                     "&&"
or                      "||"
rbrace                  "}"
rpar                    ")"
rsq                     "]"
package                 "package"
return                  "return"
else                    "else"
for                     "for"
if                      "if"
var                     "var"
int                     "int"
float32                 "float32"
bool                    "bool"
string                  "string"
print                   "fmt.Println"
parseint                "strconv.Atoi"
func                    "func"
cmdargs                 "os.Args"
reserved                "++"|"--"|"null"|"break"|"case"|"chan"|"const"|"continue"|"default"|"defer"|"fallthrough"|"go"|"goto"|"import"|"interface"|"map"|"range"|"select"|"struct"|"switch"|"type"




%%



{semicolon}                             {if(flag == 1)printf("SEMICOLON\n");last_token=0;}
{comma}                                 {if(flag == 1)printf("COMMA\n");last_token=0;}
{blankid}                               {if(flag == 1)printf("BLANKID\n");last_token=0;}
{assign}                                {if(flag == 1)printf("ASSIGN\n");last_token=0;}
{star}                                  {if(flag == 1)printf("STAR\n");last_token=0;}
{div}                                   {if(flag == 1)printf("DIV\n");last_token=0;}
{minus}                                 {if(flag == 1)printf("MINUS\n");last_token=0;}
{plus}                                  {if(flag == 1)printf("PLUS\n");last_token=0;}
{eq}                                    {if(flag == 1)printf("EQ\n");last_token=0;}
{ge}                                    {if(flag == 1)printf("GE\n");last_token=0;}
{gt}                                    {if(flag == 1)printf("GT\n");last_token=0;}
{lbrace}                                {if(flag == 1)printf("LBRACE\n");last_token=0;} //aqui acho q temos de mander o last_token=1 por causa dos comentarios
{le}                                    {if(flag == 1)printf("LE\n");last_token=0;}
{lpar}                                  {if(flag == 1)printf("LPAR\n");last_token=0;}
{lsq}                                   {if(flag == 1)printf("LSQ\n");last_token=0;}
{lt}                                    {if(flag == 1)printf("LT\n");last_token=0;}
{mod}                                   {if(flag == 1)printf("MOD\n");last_token=0;}
{ne}                                    {if(flag == 1)printf("NE\n");last_token=0;}
{not}                                   {if(flag == 1)printf("NOT\n");last_token=0;}
{and}                                   {if(flag == 1)printf("AND\n");last_token=0;}
{or}                                    {if(flag == 1)printf("OR\n");last_token=0;}
{rbrace}                                {if(flag == 1)printf("RBRACE\n");last_token=1;}
{rpar}                                  {if(flag == 1)printf("RPAR\n");last_token=1;}
{rsq}                                   {if(flag == 1)printf("RSQ\n");last_token=1;}
{package}                               {if(flag == 1)printf("PACKAGE\n");last_token=0;}
{return}                                {if(flag == 1)printf("RETURN\n");last_token=1;}
{else}                                  {if(flag == 1)printf("ELSE\n");last_token=0;}
{for}                                   {if(flag == 1)printf("FOR\n");last_token=0;}
{if}                                    {if(flag == 1)printf("IF\n");last_token=0;}
{var}                                   {if(flag == 1)printf("VAR\n");last_token=0;}
{int}                                   {if(flag == 1)printf("INT\n");last_token=0;}
{float32}                               {if(flag == 1)printf("FLOAT32\n");last_token=0;}
{bool}                                  {if(flag == 1)printf("BOOL\n");last_token=0;}
{string}                                {if(flag == 1)printf("STRING\n");last_token=0;}
{print}                                 {if(flag == 1)printf("PRINT\n");last_token=0;}
{parseint}                              {if(flag == 1)printf("PARSEINT\n");last_token=0;}
{func}                                  {if(flag == 1)printf("FUNC\n");last_token=0;}
{cmdargs}                               {if(flag == 1)printf("CMDARGS\n");last_token=0;}


{reserved}                              {if(flag == 1)printf("RESERVED(%s)\n",yytext);last_token=0;}


{identifier}                            {if(flag == 1)printf("IDENTIFIER(%s)\n",yytext);last_token=1;}
{natural}                               {if(flag == 1)printf("NATURAL(%s)\n",yytext);last_token=1;}
{decimal}|{decimal_expo}                {if(flag == 1)printf("DECIMAL(%s)\n",yytext);last_token=1;}


0[0-9]+                                 { printf("Line %d, column %d: invalid octal constant (%s)\n", linha,coluna - (int)strlen(yytext),yytext); } //o erro e para ser dado no primeiro digito



"\f"|"\t"|" "                           {}
\n|\r|\r\n                              {linha++;coluna = 1;if(flag==1 && last_token==1)printf("SEMICOLON\n");last_token=0;}




\"                                      {BEGIN(STRLIT); flag_string=1;strlit = yytext; linha_coluna[0]=linha; linha_coluna[1]=coluna-1;}
<STRLIT>{strlit}                        {}
<STRLIT>\\(.?)                             {printf("Line %d, column %d: invalid escape sequence (%s)\n",linha,coluna-(int)strlen(yytext),yytext);flag_string=0;}
<STRLIT>{newline}                       {linha++; coluna= 1; printf("Line %d, column %d: unterminated string literal\n",linha_coluna[0],linha_coluna[1]);BEGIN(INITIAL);}
<STRLIT>\"                              {if(flag==1&&flag_string==1){printf("STRLIT(%s)\n",strlit);last_token=1;};BEGIN(INITIAL);}
<STRLIT><<EOF>>                         {printf("Line %d, column %d: unterminated string literal\n",linha_coluna[0],linha_coluna[1]); coluna+=yyleng; BEGIN(INITIAL);}



"/*"                                    {BEGIN(COMMENT_ASTERISCO);linha_coluna[0]=linha;linha_coluna[1]=coluna-2;}
<COMMENT_ASTERISCO>"*/"                 {BEGIN(INITIAL);}
<COMMENT_ASTERISCO>{newline}            {coluna=1,linha++;}
<COMMENT_ASTERISCO>.                    {}
<COMMENT_ASTERISCO><<EOF>>              {printf("Line %d, column %d: unterminated comment\n",linha_coluna[0],linha_coluna[1]);BEGIN(INITIAL);last_token=0;}

"//"                                    {BEGIN(COMMENT_BARRAS);}
<COMMENT_BARRAS>{newline}               {BEGIN(INITIAL);coluna=1,linha++;if(last_token==1)printf("SEMICOLON\n");last_token=0;}
<COMMENT_BARRAS>.                       {}

.                                       { printf("Line %d, column %d: illegal character (%s)\n", linha,coluna-1,yytext); } 
<<EOF>>                                 {linha++;coluna = 1;if(flag==1 && last_token==1)printf("SEMICOLON\n");last_token=0;return 1;}

%%



extern int yylex();
int main(int argc, char *argv[])
{
    if (argc > 1) {
        if (strcmp(argv[1],"-l") == 0) {
            flag = 1;
        }
    }
    yylex();
    return 0;
}
int yywrap() {  /* called on EOF, return 1 to terminate */
    return 1;
}
