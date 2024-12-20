%{
#include "syntaxe.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno; // Numéro de ligne courant
int colonne = 1;     // Colonne courante

void yyerror(const char *msg);
%}

%option noyywrap
%option yylineno

/* Définition des motifs */
lettre [a-zA-Z]
chiffre [0-9]
id {lettre}({lettre}|{chiffre}|_){0,9}

commentaire_ligne "--".*##
commentaire_multi "\\{\\-([^{}]|(\\{[^-]*\\-\\}))*\\-\\}"
entier      [0-9]+
reel        [0-9]+\.[0-9]+
texte "\"[^\"]*\""

/* Règles Lexicales */
%%
"DEBUT"                  return DEBUT;
"FIN"                    return FIN;
"EXECUTION"              return EXECUTION;
"NUM"                    return NUM;
"REAL"                   return REAL;
"TEXT"                   return TEXT;
"FIXE"                   return FIXE;
"SI"                     return SI;
"ALORS"                  return ALORS;
"SINON"                  return SINON;
"TANTQUE"                return TANTQUE;
"FAIRE"                  return FAIRE;
"affiche"                return AFFICHE;
"lire"                   return LIRE;

{commentaire_ligne}      ; /* Ignorer les commentaires sur une ligne */
{commentaire_multi}      ; /* Ignorer les commentaires multi-lignes */

{id}                     { yylval.str = strdup(yytext); return ID; }
{entier}                 { yylval.entier = atoi(yytext); return CST_ENTIER; }
{reel}                   { yylval.reel = atof(yytext); return CST_REEL; }
{texte}                  { yylval.str = strdup(yytext); return CST_TEXTE; }

"<-"                     return AFF;
";"                      return PVG;
":"                      return DP;
","                      return VRG;
"{"                      return ACC_OUV;
"}"                      return ACC_FER;
"["                      return CRO_OUV;
"]"                      return CRO_FER;
"="                      return EGAL;
"!="                     return DIFF;
"<"                      return INF;
"<="                     return INFEG;
">"                      return SUP;
">="                     return SUPEG;
"+"                      return PLUS;
"-"                      return MOINS;
"*"                      return MULT;
"/"                      return DIV;
"ET"                     return ET;
"OU"                     return OU;
"NON"                    return NON;

[ \t]+                   ; /* Ignore spaces and tabs */
\n                       { yylineno++; colonne = 1; } /* Handle new lines */
[^\t\n ]                 { colonne += strlen(yytext); }
.                        { 
    printf("Erreur lexicale à la ligne %d, colonne %d : caractère inconnu '%c'\n", yylineno, colonne, yytext[0]); 
    exit(1); 
}
%%
int yywrap() { return 1; }
