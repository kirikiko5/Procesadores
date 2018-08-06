10	DATA X,Y,Z
20	LET X$ = 3 REM fallo semantico
30	PRINT "HOLA QUE TAL?"
40	FOR I$ = 1 TO Z REM fallo semantico
	50	TAN(X$) REM fallo semantico
70	NEXT I
80	READ Z$
90	RANDOMIZE REM falta la funcion RND
100	RESTORE
110	END