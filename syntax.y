%{
    #include <stdio.h>
    #include <stdlib.h>

    extern int nb_ligne;
    extern int yylex();
    void yyerror(const char *msg);
%}

%token MC_BEGINPROJECT MC_SETUP MC_RUN MC_ENDPROJECT
%token MC_DEFINE MC_CONST
%token INTEGER_TYPE FLOAT_TYPE
%token IF THEN ELSE ENDIF
%token LOOP_WHILE ENDLOOP
%token FOR IN TO ENDFOR
%token INPUT OUTPUT
%token AND OR NON
%token OP_AFFECT INITIALISATION
%token OP_ADD OP_SUB OP_MUL OP_DIV
%token OP_COMP_SUP OP_COMP_INF OP_COMP_SUP_EG OP_COMP_INF_EG OP_COMP_EQ OP_COMP_NEQ
%token PVG DEUX_POINTS VIRGULE PIPE
%token PARENTHESE_OUV PARENTHESE_FER
%token CROCHET_OUV CROCHET_FER
%token ACCOLADE_OUV ACCOLADE_FER
%token IDF CHAINE
%token ENTIER REEL CONST_SIGNEE

%right OP_AFFECT
%left OP_ADD OP_SUB
%left OP_MUL OP_DIV

%start programme

%%

programme: 
    MC_BEGINPROJECT DEUX_POINTS IDF PVG  
    section_setup 
    section_run 
    MC_ENDPROJECT PVG
;

section_setup:
    MC_SETUP DEUX_POINTS instruction_setup
;

section_run:
    MC_RUN DEUX_POINTS ACCOLADE_OUV instruction_run ACCOLADE_FER
;

instruction_setup:
    declaration PVG
    | definition_constante PVG
;

instruction_run:
    instruction_controle
    | instruction_io
    | affectation
;

declaration:
    MC_DEFINE liste_idf DEUX_POINTS type PVG
    | MC_DEFINE liste_idf DEUX_POINTS type INITIALISATION constante PVG
    | MC_DEFINE IDF DEUX_POINTS CROCHET_OUV type PVG ENTIER CROCHET_FER PVG
;

definition_constante:
    MC_CONST IDF DEUX_POINTS type INITIALISATION constante PVG
;

type:
    INTEGER_TYPE
    | FLOAT_TYPE
;

liste_idf:
    IDF
    | liste_idf PIPE IDF
;

constante:
    ENTIER
    | REEL
    | CONST_SIGNEE
;

affectation
    : IDF OP_AFFECT expression
;

instruction_controle
    : instruction_if
    | instruction_loop_while
    | instruction_for
;

instruction_if:
    IF PARENTHESE_OUV condition PARENTHESE_FER THEN DEUX_POINTS
    ACCOLADE_OUV instruction_run ACCOLADE_FER
    partie_else
    ENDIF PVG
;

partie_else:
    /* vide */
    | ELSE ACCOLADE_OUV instruction_run ACCOLADE_FER
;

instruction_loop_while:
    LOOP_WHILE PARENTHESE_OUV condition PARENTHESE_FER 
    ACCOLADE_OUV instruction_run ACCOLADE_FER
    ENDLOOP PVG
;

instruction_for:
    FOR IDF IN ENTIER TO ENTIER
    ACCOLADE_OUV instruction_run ACCOLADE_FER
    ENDFOR PVG
;


instruction_io:
    INPUT PARENTHESE_OUV IDF PARENTHESE_FER PVG
    | OUTPUT PARENTHESE_OUV CHAINE PARENTHESE_FER PVG
    | OUTPUT PARENTHESE_OUV IDF PARENTHESE_FER PVG
    | OUTPUT PARENTHESE_OUV CHAINE VIRGULE IDF PARENTHESE_FER PVG
;

condition:
    expression OP_COMP_SUP expression
    | expression OP_COMP_INF expression
    | expression OP_COMP_SUP_EG expression
    | expression OP_COMP_INF_EG expression
    | expression OP_COMP_EQ expression
    | expression OP_COMP_NEQ expression
    | condition_booleenne
;

condition_booleenne:
    condition AND condition
    | condition OR condition
    | NON condition
;

expression:
    expression OP_ADD terme
    | expression OP_SUB terme
    | terme
;

terme:
    terme OP_MUL facteur
    | terme OP_DIV facteur
    | facteur
;

facteur:
    IDF
    | ENTIER
    | REEL
    | CONST_SIGNEE
    | PARENTHESE_OUV expression PARENTHESE_FER
;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Erreur syntaxique a la ligne %d : %s\n", nb_ligne, msg);
}

int main() {
    printf("Debut de l'analyse syntaxique...\n");
    int resultat = yyparse();
    if(resultat == 0) {
        printf("Analyse syntaxique reussie !\n");
    } else {
        printf("Analyse syntaxique terminee avec des erreurs.\n");
    }
    return resultat;
}