%{
	/* Delimitadores de codigo C */
	#include <stdio.h>
%}


%token NOMBRE_TOKEN
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

%left '&&' '||'
%left '+' '-'
%left '*' '/'
%right '!'

%%

programa: main TOK_LLAVEIZQUIERDA declaraciones funciones sentencias TOK_LLAVEDERECHA;

declaraciones: 	  declaracion
				| declaracion declaraciones

%%