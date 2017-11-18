%{
	/* Delimitadores de codigo C */
	#include <stdio.h>
	extern int yylex();
	extern int yyparse();
	extern FILE *yyout;
%}


%token TOK_MAIN
%token TOK_INT
%token TOK_BOOLEAN
%token TOK_ARRAY
%token TOK_FUNCTION
%token TOK_IF
%token TOK_ELSE
%token TOK_WHILE
%token TOK_SCANF
%token TOK_PRINTF
%token TOK_RETURN

%token TOK_PUNTOYCOMA
%token TOK_COMA
%token TOK_PARENTESISIZQUIERDO
%token TOK_PARENTESISDERECHO
%token TOK_CORCHETEIZQUIERDO
%token TOK_CORCHETEDERECHO
%token TOK_LLAVEIZQUIERDA
%token TOK_LLAVEDERECHA
%token TOK_ASIGNACION
%token TOK_MAS
%token TOK_MENOS
%token TOK_DIVISION
%token TOK_ASTERISCO
%token TOK_AND
%token TOK_OR
%token TOK_NOT
%token TOK_IGUAL
%token TOK_DISTINTO
%token TOK_MENORIGUAL
%token TOK_MAYORIGUAL
%token TOK_MENOR
%token TOK_MAYOR

%token TOK_IDENTIFICADOR

%token TOK_CONSTANTE_ENTERA
%token TOK_TRUE
%token TOK_FALSE

%token TOK_IGNORED
%token TOK_SALTOLINEA

%token TOK_ERROR

%start programa

%left TOK_AND TOK_OR
%left TOK_MAS TOK_MENOS
%left TOK_ASTERISCO TOK_DIVISION
%right TOK_NOT contrario

%%

programa: TOK_MAIN TOK_LLAVEIZQUIERDA declaraciones funciones sentencias TOK_LLAVEDERECHA {fprintf(yyout , ";R1:\t<programa> ::= main { <declaraciones> <funciones> <sentencias> }\n");};

declaraciones: 	  declaracion {fprintf(yyout , ";R2:\t<declaraciones> ::= <declaracion>\n");}
				| declaracion declaraciones {fprintf(yyout , ";R3:\t<declaraciones> ::= <declaracion> <declaraciones>\n");};

declaracion:	clase identificadores {fprintf(yyout , ";R4:\t<declaracion> ::= <clase> <identificadores>\n");};

clase:	  clase_escalar {fprintf(yyout , ";R5:\t<clase> ::= <clase_escalar>\n");}
		| clase_vector {fprintf(yyout , ";R7:\t<clase> ::= <clase_vector>\n");};

clase_escalar:	tipo {fprintf(yyout , ";R9:\t<clase_escalar> ::= <tipo>");};

tipo:     TOK_INT {fprintf(yyout , ";R10:\t<tipo> ::= int\n");}
		| TOK_BOOLEAN {fprintf(yyout , ";R11:\t<tipo> ::= boolean\n");};

clase_vector:	  TOK_ARRAY tipo TOK_LLAVEIZQUIERDA constante_entera TOK_LLAVEDERECHA {fprintf(yyout , ";R15:\t<clase_vector> ::= array <tipo> [ <constante_entera> ]\n");};

identificadores:	  identificador {fprintf(yyout , ";R18:\t<identificadores> ::= <identificador>");}
					| identificador TOK_COMA identificadores {fprintf(yyout , ";R19:\t<identificadores> ::= <identificador> , <identificadores>\n");};

funciones:	  funcion funciones{fprintf(yyout , ";R20:\t<funciones> ::= <funcion> <funciones>\n");}
			| /* vacio */ {fprintf(yyout , ";R21:<funciones> ::=\n");};

funcion: 	TOK_FUNCTION tipo identificador TOK_PARENTESISIZQUIERDO parametros_funcion TOK_PARENTESISDERECHO TOK_LLAVEIZQUIERDA
					declaraciones_funcion sentencias TOK_LLAVEDERECHA {fprintf(yyout , ";R22:\t<funcion> ::= function <tipo> <identificador> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }  \n");};

parametros_funcion: 	  parametro_funcion resto_parametros_funcion {fprintf(yyout, ";R23:\t<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>\n");}
						| /* vacio */ {fprintf(yyout , ";R24:\t<parametros_funcion> ::=\n");};

resto_parametros_funcion: 	TOK_PUNTOYCOMA parametro_funcion resto_parametros_funcion {fprintf(yyout , ";R25:\t<resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>\n");}
						| /* vacio */ {fprintf(yyout , ";R26:\t<resto_parametros_funcion ::=\n");};

parametro_funcion: 	tipo identificador {fprintf(yyout , ";R27:\t<parametro_funcion> ::= <tipo><identificador>\n");};

declaraciones_funcion: 	  declaraciones {fprintf(yyout , ";R28:\t<declaraciones_funcion> ::= <declaraciones>\n");}
						| /* vacio */ {fprintf(yyout , ";R29:\t<declaraciones_funcion> ::=\n");};

sentencias: 	  sentencia {fprintf(yyout , ";R30:\t<sentencias> ::= <sentencia>\n");}
				| sentencia sentencias {fprintf(yyout , ";R31\t<sentencia> ::= <sentencia> <sentencias>\n");};

sentencia: 	  sentencia_simple TOK_PUNTOYCOMA {fprintf(yyout , "Ha traducido la primera linea\n");}
			| bloque {fprintf(yyout , "Ha traducido la primera linea\n");};

sentencia_simple: 	  asignacion {fprintf(yyout , "Ha traducido la primera linea\n");}
					| lectura {fprintf(yyout , "Ha traducido la primera linea\n");}
					| escritura {fprintf(yyout , "Ha traducido la primera linea\n");}
					| retorno_funcion {fprintf(yyout , "Ha traducido la primera linea\n");};

bloque:   condicional {fprintf(yyout , "Ha traducido la primera linea\n");}
		| bucle {fprintf(yyout , "Ha traducido la primera linea\n");};

asignacion:	  identificador TOK_IGUAL exp {fprintf(yyout , "Ha traducido la primera linea\n");}
			| elemento_vector TOK_IGUAL exp {fprintf(yyout , "Ha traducido la primera linea\n");};

elemento_vector:    identificador TOK_CORCHETEIZQUIERDO exp TOK_CORCHETEDERECHO {fprintf(yyout , "Ha traducido la primera linea\n");};

condicional:  TOK_IF TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO TOK_LLAVEIZQUIERDA sentencias TOK_LLAVEDERECHA {fprintf(yyout , "Ha traducido la primera linea\n");}
			| TOK_IF TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO TOK_LLAVEIZQUIERDA sentencias TOK_LLAVEDERECHA TOK_ELSE TOK_LLAVEIZQUIERDA sentencias TOK_LLAVEDERECHA {fprintf(yyout , "Ha traducido la primera linea\n");};

bucle: TOK_WHILE TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO TOK_LLAVEIZQUIERDA sentencias TOK_LLAVEDERECHA {fprintf(yyout , "Ha traducido la primera linea\n");};

lectura: TOK_SCANF identificador {fprintf(yyout , "Ha traducido la primera linea\n");};

escritura: TOK_PRINTF exp {fprintf(yyout , "Ha traducido la primera linea\n");};

retorno_funcion: TOK_RETURN exp {fprintf(yyout , "Ha traducido la primera linea\n");};

exp:  exp TOK_MAS exp {fprintf(yyout , "Ha traducido la primera linea\n");}
	| exp TOK_MENOS exp {fprintf(yyout , "Ha traducido la primera linea\n");}
	| exp TOK_DIVISION exp {fprintf(yyout , "Ha traducido la primera linea\n");}
	| exp TOK_ASTERISCO exp {fprintf(yyout , "Ha traducido la primera linea\n");}
	| contrario {fprintf(yyout , "Ha traducido la primera linea\n");}
	| exp TOK_AND exp {fprintf(yyout , "Ha traducido la primera linea\n");}
	| exp TOK_OR exp {fprintf(yyout , "Ha traducido la primera linea\n");}
	| TOK_MENOS contrario exp {fprintf(yyout , "Ha traducido la primera linea\n");} 
	| TOK_NOT exp {fprintf(yyout , "Ha traducido la primera linea\n");}
	| identificador {fprintf(yyout , "Ha traducido la primera linea\n");}
	| constante {fprintf(yyout , "Ha traducido la primera linea\n");}
	| TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO {fprintf(yyout , "Ha traducido la primera linea\n");}
	| TOK_PARENTESISIZQUIERDO comparacion TOK_PARENTESISDERECHO {fprintf(yyout , "Ha traducido la primera linea\n");}
	| elemento_vector {fprintf(yyout , "Ha traducido la primera linea\n");}
	| identificador TOK_PARENTESISIZQUIERDO lista_expresiones TOK_PARENTESISDERECHO {fprintf(yyout , "Ha traducido la primera linea\n");};

lista_expresiones: 	  exp resto_lista_expresiones {fprintf(yyout , "Ha traducido la primera linea\n");}
					| /* vacio */ {fprintf(yyout , "Ha traducido la primera linea\n");};

resto_lista_expresiones:	  TOK_COMA exp resto_lista_expresiones {fprintf(yyout , "Ha traducido la primera linea\n");}
							|  /* vacio */ {fprintf(yyout , "Ha traducido la primera linea\n");};

comparacion:	  exp TOK_IGUAL exp {fprintf(yyout , "Ha traducido la primera linea\n");}
				| exp TOK_DISTINTO exp {fprintf(yyout , "Ha traducido la primera linea\n");}
				| exp TOK_MENORIGUAL exp {fprintf(yyout , "Ha traducido la primera linea\n");}
				| exp TOK_MAYORIGUAL exp {fprintf(yyout , "Ha traducido la primera linea\n");}
				| exp TOK_MENOR exp {fprintf(yyout , "Ha traducido la primera linea\n");}
				| exp TOK_MAYOR exp {fprintf(yyout , "Ha traducido la primera linea\n");};

constante:	  constante_logica {fprintf(yyout , "Ha traducido la primera linea\n");}
			| constante_entera {fprintf(yyout , "Ha traducido la primera linea\n");};

constante_logica:	  TOK_TRUE {fprintf(yyout , "Ha traducido la primera linea\n");}
					| TOK_FALSE {fprintf(yyout , "Ha traducido la primera linea\n");};

constante_entera:	  TOK_CONSTANTE_ENTERA {fprintf(yyout , "Ha traducido la primera linea\n");};

identificador:	TOK_IDENTIFICADOR {fprintf(yyout , "Ha traducido la primera linea\n");};
%%
