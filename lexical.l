%{
#include<stdio.h>
#include "syntax.tab.h"
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

BeginProject     {return MC_BEGINPROJECT; printf("MC_BEGINPROJECT\n"); }
Setup            {return MC_SETUP; printf("MC_SETUP\n"); }
Run              {return MC_RUN; printf("MC_RUN\n"); }
EndProject       {return MC_ENDPROJECT; printf("MC_ENDPROJECT\n"); }
define           {return MC_DEFINE; printf("MC_DEFINE\n"); }
const             { return MC_CONST; printf("MC_CONST\n"); }
integer          { return MC_INTEGER; printf("INTEGER_TYPE\n"); }
float            { return MC_FLOAT; printf("FLOAT_TYPE\n"); } 

if               {return IF; printf("IF\n"); }
then             { return THEN; printf("THEN\n"); }
else             { return ELSE; printf("ELSE\n"); }
endif            { return ENDIF; printf("ENDIF\n"); }
"loop while"      { return LOOP_WHILE; printf("LOOP_WHILE\n"); }
endloop          { return ENDLOOP; printf("ENDLOOP\n"); }
for              { return FOR; printf("FOR\n"); }
in               { return IN; printf("IN\n"); }
to               { return TO; printf("TO\n"); }
endfor           { return ENDFOR; printf("ENDFOR\n"); }
input            { return INPUT; printf("INPUT\n"); }
output           { return OUTPUT; printf("OUTPUT\n"); }
AND              { return AND; printf("AND\n"); }
OR               { return OR; printf("OR\n"); }
NON              { return NON; printf("NON\n"); }

{CHAINE}         {return printf ("chaine %s \n",yytext) ;}
{entier}         { return printf ("entier %s \n",yytext) ;}
{reel}           { return printf ("reel %s \n",yytext) ;} 
{CST_signe}      { return printf ("constante signee %s \n",yytext) ;}
{IDF}            { return printf ("IDF est: %s \n",yytext) ;}
{comnt_ligne}  { /* ignorer */ }

"←"              { return printf("OP_AFFECT \n"); }
"="              { return printf("INITIALISATION\n"); }
"+"              { return printf("OP_ADD\n"); }
"-"              { return printf("OP_DIFF\n"); }
"*"              { return printf("OP_MUL\n"); }
"/"              { return printf("OP_DIV\n"); }
">"              { return printf("OP_COMP_SUP\n"); }
"<"              { return printf("OP_COMP_INF\n"); }
">="             { return printf("OP_COMP_SUP_EG\n"); }
"<="             { return printf("OP_COMP_INF_EG\n"); }
"=="             { return printf("OP_COMP_EQ\n"); }
"!="             { return printf("OP_COMP_NEQ\n"); }

";"              { return printf("PVG \n"); }
":"              { return printf("DEUX_POINTS\n"); }
","              { return printf("VIRGULE\n"); }
"|"              { return printf("PIPE\n"); }
"("              { return printf("PARENTHESE_OUV\n"); }
")"              { return printf("PARENTHESE_FER\n"); }
"["              { return printf("CROCHET_OUV\n"); }
"]"              { return printf("CROCHET_FER\n"); }
"{"              { return printf("ACCOLADE_OUV\n"); }
"}"              { return printf("ACCOLADE_FER\n"); }

[ \t]+         { /* ignorer */ }
\n               { nb_ligne++; cpt_col = 1; }

.                { printf(" Erreur lexicale: caractere '%c' non reconnu a la ligne %d\n",yytext[0], nb_ligne); }

%%
/*
int main()
{
    yylex();
    return 0;
}*/

int yywrap() {
    return 1;
}
