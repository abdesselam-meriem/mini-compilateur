bison -d syntax.y
flex lexical.l
gcc lex.yy.c syntax.tab.c -o projet 
projet < test.txt