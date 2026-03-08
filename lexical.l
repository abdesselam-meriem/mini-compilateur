%{
#include<stdio.h>
//#include "syntax.tab.h"
int nb_ligne=1;
int cpt_col=1;
%}

entier           [0-9]+
reel             [0-9]+\.[0-9]+         
comnt_ligne "%%".* 
IDF   [a-z]([a-z0-9]|_([a-z0-9])){0,12}[a-z0-9]
CST_signe  \([+-][0-9]+(\.[0-9]+)?\)

%%

"BeginProject"     { return BEGINPROJECT; }
"Setup"            { return SETUP; }
"Run"              { return RUN; }
"EndProject"       { return ENDPROJECT; }
"define"           { return DEFINE; }
"const"            { return CONST; }

"integer"          { return INTEGER_TYPE; }
"float"            { return FLOAT_TYPE; }

"if"               { return IF; }
"then"             { return THEN; }
"else"             { return ELSE; }
"endif"            { return ENDIF; }
"loop while"       { return LOOP_WHILE; }
"endloop"          { return ENDLOOP; }
"for"              { return FOR; }
"in"               { return IN; }
"to"               { return TO; }
"endfor"           { return ENDFOR; }
"input"               { return INPUT; }
"output"              { return OUTPUT; }
"AND"              { return AND; }
"OR"               { return OR; }
"NON"              { return NON; }

"←"              { return ASSIGN; }
"+"              { return PLUS; }
"-"              { return MINUS; }
"*"              { return MULT; }
"/"              { return DIV; }
">"              { return GT; }
"<"              { return LT; }
">="             { return GE; }
"<="             { return LE; }
"=="             { return EQ; }
"!="             { return NE; }

";"              { return SEMICOLON; }
":"              { return COLON; }
","              { return COMMA; }
"|"              { return PIPE; }
"("              { return LPAREN; }
")"              { return RPAREN; }
"["              { return LBRACKET; }
"]"              { return RBRACKET; }
"{"              { return LBRACE; }
"}"              { return RBRACE; }

{entier}         { return INTEGER_CONST; }
{reel}           { return FLOAT_CONST; }
{CST_signe} { return SIGNED_CONST; }
{IDF} { return IDENTIFIER; }
{comnt_ligne}  { /* ignorer */ }
[ \t]+         { /* ignorer */ }
\n               { nb_ligne++; cpt_col = 1; }

.                { printf("Erreur lexicale: caractère '%c' non reconnu à la ligne %d, colonne %d\n",yytext[0], nb_ligne, cpt_col); }

%%

int yywrap() {
    return 1;
}
