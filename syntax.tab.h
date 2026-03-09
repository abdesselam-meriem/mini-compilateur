
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
     MC_BEGINPROJECT = 258,
     MC_SETUP = 259,
     MC_RUN = 260,
     MC_ENDPROJECT = 261,
     MC_DEFINE = 262,
     MC_CONST = 263,
     INTEGER_TYPE = 264,
     FLOAT_TYPE = 265,
     IF = 266,
     THEN = 267,
     ELSE = 268,
     ENDIF = 269,
     LOOP_WHILE = 270,
     ENDLOOP = 271,
     FOR = 272,
     IN = 273,
     TO = 274,
     ENDFOR = 275,
     INPUT = 276,
     OUTPUT = 277,
     AND = 278,
     OR = 279,
     NON = 280,
     OP_AFFECT = 281,
     INITIALISATION = 282,
     OP_ADD = 283,
     OP_SUB = 284,
     OP_MUL = 285,
     OP_DIV = 286,
     OP_COMP_SUP = 287,
     OP_COMP_INF = 288,
     OP_COMP_SUP_EG = 289,
     OP_COMP_INF_EG = 290,
     OP_COMP_EQ = 291,
     OP_COMP_NEQ = 292,
     PVG = 293,
     DEUX_POINTS = 294,
     VIRGULE = 295,
     PIPE = 296,
     PARENTHESE_OUV = 297,
     PARENTHESE_FER = 298,
     CROCHET_OUV = 299,
     CROCHET_FER = 300,
     ACCOLADE_OUV = 301,
     ACCOLADE_FER = 302,
     IDF = 303,
     CHAINE = 304,
     ENTIER = 305,
     REEL = 306,
     CONST_SIGNEE = 307
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


