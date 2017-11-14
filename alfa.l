%{
/* delimitadores de código C */
/* Esta seccion suele contener declaradores de variables y funciones que se utilizan posteriormente asi como directivas include */
#include <stdio.h>
#include "tokens.h"
%}

%option noyywrap
%option noinput
%option nounput

%%

main { return TOK_MAIN; }
int { return TOK_INT; }
boolean { return TOK_BOOLEAN; }
array { return TOK_ARRAY; }
function { return TOK_FUNCTION; }
if { return TOK_IF; }
else { return TOK_ELSE; }
while { return TOK_WHILE; }
scanf { return TOK_SCANF; }
printf { return TOK_PRINTF; }
return { return TOK_RETURN; }
true { return TOK_TRUE; }
false { return TOK_FALSE; }

"//".* { return TOK_IGNORED; }

";" { return TOK_PUNTOYCOMA; }
"," { return TOK_COMA; }
"(" { return TOK_PARENTESISIZQUIERDO; }
")" { return TOK_PARENTESISDERECHO; }
"[" { return TOK_CORCHETEIZQUIERDO; }
"]" { return TOK_CORCHETEDERECHO; }
"{" { return TOK_LLAVEIZQUIERDA; }
"}" { return TOK_LLAVEDERECHA; }
"=" { return TOK_ASIGNACION; }
"+" { return TOK_MAS; }
"-" { return TOK_MENOS; }
"/" { return TOK_DIVISION; }
"*" { return TOK_ASTERISCO; }
"&&" { return TOK_AND; }
"||" { return TOK_OR; }
"!" { return TOK_NOT; }
"==" { return TOK_IGUAL; }
"!=" { return TOK_DISTINTO; }
"<=" { return TOK_MENORIGUAL; }
">=" { return TOK_MAYORIGUAL; }
"<" { return TOK_MENOR; }
">" { return TOK_MAYOR; }

[a-zA-Z][0-9a-zA-Z]* { return TOK_IDENTIFICADOR; }

[0-9]+ { return TOK_CONSTANTE_ENTERA; }

[ \t] { return TOK_IGNORED; }

[\n] { return TOK_SALTOLINEA;}

. { return TOK_ERROR; }

%%
