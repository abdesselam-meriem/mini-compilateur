%{
#include<stdio.h>
int nb_ligne=1;
int cpt_col=1;
%}

lettre            [a-zA-Z]
chiffre           [0-9]
entier           {chiffre}+
reel             {chiffre}+\.{chiffre}+ 
CHAINE    \"[^\"]*\"        
comnt_ligne "%%".* 
IDF   {lettre}({lettre}|{chiffre}|_({lettre}|{chiffre})){0,12}({lettre}|{chiffre})?
CST_signe  [+-]{chiffre}+(\.{chiffre}+)?

%%

BeginProject     { printf("MC_BEGINPROJECT\n"); }
Setup            { printf("MC_SETUP\n"); }
Run              { printf("MC_RUN\n"); }
EndProject       { printf("MC_ENDPROJECT\n"); }
define           { printf("MC_DEFINE\n"); }
const              { printf("MC_CONST\n"); }
integer          { printf("INTEGER_TYPE\n"); }
float            { printf("FLOAT_TYPE\n"); } 

if               { printf("IF\n"); }
then             { printf("THEN\n"); }
else             { printf("ELSE\n"); }
endif            { printf("ENDIF\n"); }
"loop while"      { printf("LOOP_WHILE\n"); }
endloop          { printf("ENDLOOP\n"); }
for              { printf("FOR\n"); }
in               { printf("IN\n"); }
to               { printf("TO\n"); }
endfor           { printf("ENDFOR\n"); }
input            { printf("INPUT\n"); }
output           { printf("OUTPUT\n"); }
AND              { printf("AND\n"); }
OR               { printf("OR\n"); }
NON              { printf("NON"); }

{CHAINE}         { printf ("chaine %s \n",yytext) ;}
{entier}         { printf ("entier %s \n",yytext) ;}
{reel}           { printf ("reel %s \n",yytext) ;} 
{CST_signe}      { printf ("constante signee %s \n",yytext) ;}
{IDF}            { printf ("IDF est: %s \n",yytext) ;}
{comnt_ligne}  { /* ignorer */ }

"←"              { printf("OP_AFFECT \n"); }
"="              { printf("initialisation\n"); }
"+"              { printf("OP_ADD\n"); }
"-"              { printf("OP_DIFF\n"); }
"*"              { printf("OP_MUL\n"); }
"/"              { printf("OP_DIV\n"); }
">"              { printf("OP_COMP_SUP\n"); }
"<"              { printf("OP_COMP_INF\n"); }
">="             { printf("OP_COMP_SUP_EG\n"); }
"<="             { printf("OP_COMP_INF_EG\n"); }
"=="             { printf("OP_COMP_EQ\n"); }
"!="             { printf("OP_COMP_NEQ\n"); }

";"              { printf("PVG \n"); }
":"              { printf("DEUX_POINTS\n"); }
","              { printf("VIRGULE\n"); }
"|"              { printf("PIPE\n"); }
"("              { printf("PARENTHESE_OUV\n"); }
")"              { printf("PARENTHESE_FER\n"); }
"["              { printf("CROCHET_OUV\n"); }
"]"              { printf("CROCHET_FER\n"); }
"{"              { printf("ACCOLADE_OUV\n"); }
"}"              { printf("ACCOLADE_FER\n"); }

[ \t]+         { /* ignorer */ }
\n               { nb_ligne++; cpt_col = 1; }

.                { printf(" Erreur lexicale: caractere '%c' non reconnu a la ligne %d\n",yytext[0], nb_ligne); }

%%

int main()
{
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
