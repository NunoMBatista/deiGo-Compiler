#!/bin/sh

rm -f gocompiler lex.yy.c y.tab.c y.tab.h y.output y.gv y.png
if [ "$1" = "clean" ]; then
    exit 0
fi

yacc -d -v -t -g --report=all gocompiler.y
lex gocompiler.l
dot y.gv -Tpng -o y.png               # LALR automaton in y.png
cc -o gocompiler lex.yy.c y.tab.c ast.c -Wall -Wno-unused-function
