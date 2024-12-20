%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno;
extern int colonne;
int nb_ligne = 1;
void yyerror(const char *msg);
void inserer_table_symboles(const char *nom, const char *type);
void verifierDivisionParZero(int valeur);
int getValeur(const char* id);
%}

%union {
    int entier;
    float reel;
    char *str;
}

%token <str> ID
%token <entier> CST_ENTIER
%token <reel> CST_REEL
%token <str> CST_TEXTE
%token DEBUT FIN EXECUTION NUM REAL TEXT FIXE SI ALORS SINON TANTQUE FAIRE AFFICHE LIRE
%token AFF PVG DP VRG ACC_OUV ACC_FER CRO_OUV CRO_FER
%token EGAL DIFF INF INFEG SUP SUPEG PLUS MOINS MULT DIV ET OU NON

%type <str> type
%type <entier> affectation
%type <entier> expression
%type <entier> tableau_element
%type <entier> constante


%left PLUS MOINS
%left MULT DIV

%%

programme: DEBUT declarations EXECUTION ACC_OUV instructions ACC_FER FIN
            { printf("Programme syntaxiquement correct.\n"); }
;

declarations: declaration declarations
            | /* epsilon */
;

declaration: type DP liste_id PVG
            | FIXE type DP ID AFF constante PVG
            | type DP liste_tableaux PVG
;

type: NUM { $$ = strdup("NUM"); }
    | REAL { $$ = strdup("REAL"); }
    | TEXT { $$ = strdup("TEXT"); }
;

liste_id: ID VRG liste_id { inserer_table_symboles($1, "variable"); }
        | ID { inserer_table_symboles($1, "variable"); }
;

liste_tableaux: tableau VRG liste_tableaux
              | tableau
;

tableau: ID CRO_OUV CST_ENTIER CRO_FER { inserer_table_symboles($1, "tableau"); }
;

constante: CST_ENTIER { $$ = $1; }
         | CST_REEL { $$ = $1; }
         | CST_TEXTE { $$ = strdup($1); }
;

instructions: instruction instructions
            | /* epsilon */
;

instruction: affectation
           | condition
           | boucle
           | affiche_instr
           | lire_instr
;

affectation: ID AFF expression PVG { 
              verifierDeclaration($1);
              printf("Affectation valide à %s\n", $1); 
            }
           | tableau_element AFF expression PVG { 
              verifierDeclaration($1);
              printf("Affectation valide à un élément de tableau %s\n", $1); 
            }
;

condition: SI ACC_OUV expression ACC_FER ALORS ACC_OUV instructions ACC_FER
           SINON ACC_OUV instructions ACC_FER
;

boucle: TANTQUE ACC_OUV expression ACC_FER FAIRE ACC_OUV instructions ACC_FER
;

affiche_instr: AFFICHE ACC_OUV expression ACC_FER PVG
;

lire_instr: LIRE ACC_OUV ID ACC_FER PVG { verifierDeclaration($3); }
;

expression: expression PLUS expression { $$ = $1 + $3; }
          | expression MOINS expression { $$ = $1 - $3; }
          | expression MULT expression { $$ = $1 * $3; }
          | expression DIV expression { 
              verifierDivisionParZero($3);
              $$ = $1 / $3; 
            }
          | CST_ENTIER { $$ = $1; }
          | CST_REEL { $$ = $1; }
          | CST_TEXTE { $$ = strdup($1); }
          | ID { $$ = getValeur($1); }
          | tableau_element
;

tableau_element: ID CRO_OUV expression CRO_FER { 
                  verifierDeclaration($1);
                  verifierTailleTableau($1, $3);
                }
;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Erreur syntaxique à la ligne %d : %s\n", yylineno, msg);
}

void inserer_table_symboles(const char *nom, const char *type) {
    printf("Insertion dans la table des symboles : %s, Type : %s\n", nom, type);
}

void verifierDeclaration(const char *nom) {
    // Ajoute la logique pour vérifier si la variable est déclarée
    printf("Vérification de la déclaration : %s\n", nom);
}

void verifierDivisionParZero(int valeur) {
    if (valeur == 0) {
        yyerror("Division par zéro");
        exit(1);
    }
}

int getValeur(const char* id) {
    // Placeholder logic to retrieve the value of a variable from the symbol table
    return 42; // Replace with actual lookup logic
}

int main() {
    printf("Début de l'analyse syntaxique\n");
    yyparse();
    printf("Analyse syntaxique terminée\n");
    return 0;
}
