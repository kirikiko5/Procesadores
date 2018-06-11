
import java_cup.runtime.*;
import java.io.IOException;
import java.util.ArrayList;

%%

DIG=[-+]?[0-9]*[.]?[,]?[0-9]*?[E]?[-]?	//macro para los digitos
ID=[A-Za-z][$]	//esta macro define las variables de cadena
INT_SIM= [A-Z]			//Macro que define las variables numericas simples
INT_SUS= [A-Z][(][0-9]?[,]?[0-9][)]		//Macro que define los integer

%standalone
%line
%class AnalizadorLexico
%column  
%cup
%ignorecase // para tomar las palabras en minúsculas y mayúsculas como la misma, ej: BEGIN es la misma palabra que begin y bEgIn

%init{ 
   yyline = 1; 
   yycolumn = 1; 
%init} 


%{
	//se define un arrayList para almacenar los tokens:
	ArrayList<String> tokenList = new ArrayList<String>();
	//tambien un entero para llevar la cuenta de los errores:
	int errorLex = 0;
	
	//Metodos que vienen por defecto:

	private void error() throws IOException
	{
		throw new IOException("illegal text at line = "+yyline+", column = "+yycolumn+", text = '"+yytext()+"'");
	}
	
	//metodo para la emision de mensajes de error:
	
	public void error(int linea, int columna, String token){
		System.out.print("Hay un error lexico en la linea "+ (linea+1) +" columna "+ (columna+1));
		System.out.println("\t No es correcta la expresion: "+ token);
		errorLex++;
	}
	
	//devuelve el numero de errores de la parte lexica:
	
	public int getErrorLex (){
		return errorLex;
	}
%}

%eofval{	
 return new Symbol(AnalizadorSintacticoSym.EOF); 
%eofval}

%%

[\r\n\t ]+	{/*prescindir de blancos, tabuladores, nueva linea, etc */} 
"DATA" 		{return new Symbol (AnalizadorSintacticoSym.TK_DATA,  yyline +1 , yycolumn + 1 , yytext() );  } 
"DEF" 		{return new Symbol (AnalizadorSintacticoSym.TK_DEF,  yyline +1 , yycolumn + 1 , yytext() ); } 
"DIM" 		{return new Symbol (AnalizadorSintacticoSym.TK_DIM,  yyline +1 , yycolumn + 1 , yytext() );  } 
"END" 		{return new Symbol (AnalizadorSintacticoSym.TK_END,  yyline +1 , yycolumn + 1 , yytext() );  } 
"FOR" 		{return new Symbol (AnalizadorSintacticoSym.TK_FOR,  yyline +1 , yycolumn + 1 , yytext() );  }
"GO" 		{return new Symbol (AnalizadorSintacticoSym.TK_GO,  yyline +1 , yycolumn + 1 , yytext() ); }  
"GOSUB" 	{return new Symbol (AnalizadorSintacticoSym.TK_GOSUB,  yyline +1 , yycolumn + 1 , yytext() );  } 
"GOTO" 		{return new Symbol (AnalizadorSintacticoSym.TK_GOTO,  yyline +1 , yycolumn + 1 , yytext() ); } 
"IF" 		{return new Symbol (AnalizadorSintacticoSym.TK_IF,  yyline +1 , yycolumn + 1 , yytext() ); }
"INPUT" 	{return new Symbol (AnalizadorSintacticoSym.TK_INPUT,  yyline +1 , yycolumn + 1 , yytext() ); }
"LET" 		{return new Symbol (AnalizadorSintacticoSym.TK_LET,  yyline +1 , yycolumn + 1 , yytext() ); }
"NEXT" 		{return new Symbol (AnalizadorSintacticoSym.TK_NEXT,  yyline +1 , yycolumn + 1 , yytext() ); }
"ON" 		{return new Symbol (AnalizadorSintacticoSym.TK_ON,  yyline +1 , yycolumn + 1 , yytext() ); }
"PRINT" 		{return new Symbol (AnalizadorSintacticoSym.TK_PRINT,  yyline +1 , yycolumn + 1 , yytext() ); }
"RANDOMIZE" 	{return new Symbol (AnalizadorSintacticoSym.TK_RANDOMIZE,  yyline +1 , yycolumn + 1 , yytext() ); }
"READ" 			{return new Symbol (AnalizadorSintacticoSym.TK_READ,  yyline +1 , yycolumn + 1 , yytext() ); }
"REM" 			{return new Symbol (AnalizadorSintacticoSym.TK_REM,  yyline +1 , yycolumn + 1 , yytext() ); }
"RESTORE" 		{return new Symbol (AnalizadorSintacticoSym.TK_RESTORE,  yyline +1 , yycolumn + 1 , yytext() );  } 
"RETURN" 	{return new Symbol (AnalizadorSintacticoSym.TK_RETURN,  yyline +1 , yycolumn + 1 , yytext() );  } 
"STEP" 		{return new Symbol (AnalizadorSintacticoSym.TK_STEP,  yyline +1 , yycolumn + 1 , yytext() );  } 
"STOP" 		{return new Symbol (AnalizadorSintacticoSym.TK_STOP,  yyline +1 , yycolumn + 1 , yytext() );  } 
"THEN" 		{return new Symbol (AnalizadorSintacticoSym.TK_THEN,  yyline +1 , yycolumn + 1 , yytext() );  } 
"TO" 		{return new Symbol (AnalizadorSintacticoSym.TK_TO,  yyline +1 , yycolumn + 1 , yytext() );  } 
"FN" 		{return new Symbol (AnalizadorSintacticoSym.TK_FN,  yyline +1 , yycolumn + 1 , yytext() );  } 


"ABS" 		{return new Symbol (AnalizadorSintacticoSym.TK_ABS,  yyline +1 , yycolumn + 1 , yytext() );  } 
"ATN" 		{return new Symbol (AnalizadorSintacticoSym.TK_ATN,  yyline +1 , yycolumn + 1 , yytext() );  } 
"COS" 		{return new Symbol (AnalizadorSintacticoSym.TK_COS,  yyline +1 , yycolumn + 1 , yytext() );  } 
"EXP" 		{return new Symbol (AnalizadorSintacticoSym.TK_EXP,  yyline +1 , yycolumn + 1 , yytext() );  } 
"INT" 		{return new Symbol (AnalizadorSintacticoSym.TK_INT,  yyline +1 , yycolumn + 1 , yytext() );  } 
"LOG" 		{return new Symbol (AnalizadorSintacticoSym.TK_LOG,  yyline +1 , yycolumn + 1 , yytext() );  } 
"RND" 		{return new Symbol (AnalizadorSintacticoSym.TK_RND,  yyline +1 , yycolumn + 1 , yytext() );  } 
"SGN" 		{return new Symbol (AnalizadorSintacticoSym.TK_SGN,  yyline +1 , yycolumn + 1 , yytext() );  } 
"SIN" 		{return new Symbol (AnalizadorSintacticoSym.TK_SIN,  yyline +1 , yycolumn + 1 , yytext() );  } 
"SQR" 		{return new Symbol (AnalizadorSintacticoSym.TK_SQR,  yyline +1 , yycolumn + 1 , yytext() );  } 
"TAN" 		{return new Symbol (AnalizadorSintacticoSym.TK_TAN,  yyline +1 , yycolumn + 1 , yytext() );  } 

"+"		    {return new Symbol (AnalizadorSintacticoSym.TK_SUMA, yyline +1 , yycolumn + 1, yytext());}
"-"		    {return new Symbol (AnalizadorSintacticoSym.TK_RESTA, yyline +1 , yycolumn + 1, yytext());}
"*"		    {return new Symbol (AnalizadorSintacticoSym.TK_MUL, yyline +1 , yycolumn + 1, yytext());}
"/"		    {return new Symbol (AnalizadorSintacticoSym.TK_DIV, yyline +1 , yycolumn + 1, yytext());}
"^"			{return new Symbol (AnalizadorSintacticoSym.TK_EL, yyline +1 , yycolumn + 1, yytext());}
";"			{return new Symbol (AnalizadorSintacticoSym.TK_PUNTOCOMA, yyline +1 , yycolumn + 1, yytext());}
","			{return new Symbol (AnalizadorSintacticoSym.TK_COMA, yyline +1 , yycolumn + 1, yytext());}

"("		    {return new Symbol (AnalizadorSintacticoSym.TK_PAR_IZQ, yyline +1 , yycolumn + 1, yytext());}
")"		    {return new Symbol (AnalizadorSintacticoSym.TK_PAR_DER, yyline +1 , yycolumn + 1, yytext());}
"="		    {return new Symbol (AnalizadorSintacticoSym.TK_IGUAL, yyline +1 , yycolumn + 1, yytext());}
"<"		    {return new Symbol (AnalizadorSintacticoSym.TK_MENOR, yyline +1 , yycolumn + 1, yytext());}
">"		    {return new Symbol (AnalizadorSintacticoSym.TK_MAYOR, yyline +1 , yycolumn + 1, yytext());}
">="		{return new Symbol (AnalizadorSintacticoSym.TK_MAYOR_IGUAL, yyline +1 , yycolumn + 1, yytext());}
"<="		{return new Symbol (AnalizadorSintacticoSym.TK_MENOR_IGUAL, yyline +1 , yycolumn + 1, yytext());}
"<="		{return new Symbol (AnalizadorSintacticoSym.TK_MENOR_IGUAL, yyline +1 , yycolumn + 1, yytext());}
"<>"		{return new Symbol (AnalizadorSintacticoSym.TK_DISTINTO, yyline +1 , yycolumn + 1, yytext());}

(\")(.*)(\")	{return new Symbol (AnalizadorSintacticoSym.TK_CADENA,  yyline +1 , yycolumn + 1 , yytext() ); }

{ID}   		{return new Symbol (AnalizadorSintacticoSym.TK_ID,  yyline +1 , yycolumn + 1 , yytext() ); }
{INT_SIM} 	{return new Symbol (AnalizadorSintacticoSym.TK_INT_SIM,  yyline +1 , yycolumn + 1 , yytext() ); }
{INT_SUS} 	{return new Symbol (AnalizadorSintacticoSym.TK_INT_SUS,  yyline +1 , yycolumn + 1 , yytext() ); }
{DIG} 		{return new Symbol (AnalizadorSintacticoSym.TK_DIG,  yyline +1 , yycolumn + 1 , yytext() ); }
