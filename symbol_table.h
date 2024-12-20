#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

void ajouterVariable(char *nom, char *type);
void ajouterConstante(char *nom, char *type, int valeur);
void verifierDeclaration(char *nom);
int getValeur(char *nom);

#endif
