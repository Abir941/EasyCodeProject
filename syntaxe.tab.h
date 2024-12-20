
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     CST_ENTIER = 259,
     CST_REEL = 260,
     CST_TEXTE = 261,
     DEBUT = 262,
     FIN = 263,
     EXECUTION = 264,
     NUM = 265,
     REAL = 266,
     TEXT = 267,
     FIXE = 268,
     SI = 269,
     ALORS = 270,
     SINON = 271,
     TANTQUE = 272,
     FAIRE = 273,
     AFFICHE = 274,
     LIRE = 275,
     AFF = 276,
     PVG = 277,
     DP = 278,
     VRG = 279,
     ACC_OUV = 280,
     ACC_FER = 281,
     CRO_OUV = 282,
     CRO_FER = 283,
     EGAL = 284,
     DIFF = 285,
     INF = 286,
     INFEG = 287,
     SUP = 288,
     SUPEG = 289,
     PLUS = 290,
     MOINS = 291,
     MULT = 292,
     DIV = 293,
     ET = 294,
     OU = 295,
     NON = 296
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 15 "syntaxe.y"

    int entier;
    float reel;
    char *str;



/* Line 1676 of yacc.c  */
#line 101 "syntaxe.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


