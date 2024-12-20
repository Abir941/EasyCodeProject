#include <stdio.h>
#include <string.h>
#include "symbol_table.h"

void ajouterVariable(char *nom, char *type) {
    printf("Variable ajoutée : %s de type %s\n", nom, type);
}

void ajouterConstante(char *nom, char *type, int valeur) {
    printf("Constante ajoutée : %s de type %s avec valeur %d\n", nom, type, valeur);
}

void verifierDeclaration(char *nom) {
    printf("Vérification de la variable : %s\n", nom);
}

int getValeur(char *nom) {
    return 42; // Exemple de valeur par défaut
}
