0 DATA U$, A$, X
20 LET A$ = "constante"
 INPUT 3,1418 ; X REM fallo sintactico
30 DATA A, I$
40 INPUT 3,123 A
45 IF 3 <> A$ THEN 50 REM fallo semantico
50 LET A = 8,20 ^ 3 / A
ç REM fallo lexico
90 END