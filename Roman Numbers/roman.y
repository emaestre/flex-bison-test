/* ***************************************** *
 * Archivo para el Bison 		     		 *
 * Autores:                          	     *
 *		Eleazar Maestre - 24300665   		 * 
 *		Luis Gonzalez   - 21241236   		 *
 * ***************************************** */

/* Librerias usadas por C */
%{ 
	int yylex(); /* Esta declaracion para eliminar los warnings */
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(char *);
%}

/* Declaracion de tokens y simbolo inicial */
%token MIL QUINIENTOS CIEN CINCUENTA CINCO DIEZ UNO BLANCO END COMPLE
%start roman

%%

/* Inicio de la gramatica con el simbolo "roman" */
roman:
	/* Descompone el numero desde la denominacion mas grande hasta la mas pequeña
	   seguido del salto de linea */ 
	thous hunds tens units END{ printf("\e[92m\e[1m%d \e[0m\n",$1+$2+$3+$4);
return 0;}
;

/* Miles - Pueden ser 0, 1, 2 o 3 M */
thous: 
  MIL 				{ $$ = 1000;}
| MIL MIL 			{ $$ = 2000;}
| MIL MIL MIL   	{ $$ = 3000;}
| /*empty*/ 	    { $$ = 0;}
;

/* Cientos - numeros que van de 0 - 900 */
hunds:
  CIEN          				{ $$ = 100;}
| CIEN CIEN       				{ $$ = 200;}
| CIEN CIEN CIEN    			{ $$ = 300;}
| CIEN QUINIENTOS				{ $$ = 400;}
| QUINIENTOS 					{ $$ = 500;}
| QUINIENTOS CIEN 				{ $$ = 600;}
| QUINIENTOS CIEN CIEN  		{ $$ = 700;}
| QUINIENTOS CIEN CIEN CIEN 	{ $$ = 800;} 
| CIEN MIL    					{ $$ = 900;}
|/*empty*/    					{ $$ = 0;}
;


/* Decenas - numeros que van de 0 - 90 */
tens: 
  DIEZ          				{ $$ = 10;}
| DIEZ DIEZ 	      			{ $$ = 20;}
| DIEZ DIEZ DIEZ    			{ $$ = 30;} 
| DIEZ CINCUENTA   				{ $$ = 40;}
| CINCUENTA   					{ $$ = 50;}
| CINCUENTA DIEZ 				{ $$ = 60;}
| CINCUENTA DIEZ DIEZ  			{ $$ = 70;}
| CINCUENTA DIEZ DIEZ DIEZ  	{ $$ = 80;}
| DIEZ CIEN    		   			{ $$ = 90;}
|/*empty*/    					{ $$ = 0;}
;


/* Unidades - numeros que van de 0 - 9 */
units:
  UNO        			{ $$ = 1;}
| UNO UNO     			{ $$ = 2;}
| UNO UNO UNO  			{ $$ = 3;}
| UNO CINCO    			{ $$ = 4;}
| CINCO 	   			{ $$ = 5;}
| CINCO UNO	   			{ $$ = 6;}
| CINCO UNO UNO	   		{ $$ = 7;}
| CINCO UNO UNO UNO	   	{ $$ = 8;}
| UNO DIEZ     			{ $$ = 9;}
| /*empty*/  			{ $$ = 0;}
;

%%

/* NOTA: Los simbolos en los printf() de esta forma \e[1m\e[91m son colores 
		 para la presentacion en terminal */

int main(int argc, char* argv[])
{	
	printf("-> ");
   	yyparse();
	printf("\e[0m"); /* Color del terminal original */
	return 0;
}

void yyerror(char *s) 
{
	printf("\e[1m\e[91mERROR: error de sintaxis\n");
}
