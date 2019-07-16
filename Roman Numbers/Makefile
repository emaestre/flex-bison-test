roman: roman.y roman.lex
	bison -d roman.y
	flex -o roman.lex.c roman.lex
	gcc -o roman roman.lex.c roman.tab.c -lfl -lm 