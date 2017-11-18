%{
/* delimitadores de código C */
/* Esta seccion suele contener declaradores de variables y funciones que se utilizan posteriormente asi como directivas include */
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap
%option noinput
%option nounput

%%

main { fprintf(yyout, ";D:\tmain\n"); return TOK_MAIN; }
int { fprintf(yyout, ";D:\tint\n"); return TOK_INT; }
boolean { fprintf(yyout, ";D:\tboolean\n"); return TOK_BOOLEAN; }
array { fprintf(yyout, ";D:\tarray\n"); return TOK_ARRAY; }
function { fprintf(yyout, ";D:\tfunction\n"); return TOK_FUNCTION; }
if { fprintf(yyout, ";D:\tif\n"); return TOK_IF; }
else { fprintf(yyout, ";D:\telse\n"); return TOK_ELSE; }
while { fprintf(yyout, ";D:\twhile\n"); return TOK_WHILE; }
scanf { fprintf(yyout, ";D:\tscanf\n"); return TOK_SCANF; }
printf { fprintf(yyout, ";D:\tprintf\n"); return TOK_PRINTF; }
return { fprintf(yyout, ";D:\treturn\n"); return TOK_RETURN; }
true { fprintf(yyout, ";D:\ttrue\n"); return TOK_TRUE; }
false { fprintf(yyout, ";D:\tfalse\n"); return TOK_FALSE; }

"//".* {}

";" { fprintf(yyout, ";D:\t;\n"); return TOK_PUNTOYCOMA; }
"," { fprintf(yyout, ";D:\t,\n"); return TOK_COMA; }
"(" { fprintf(yyout, ";D:\t(\n"); return TOK_PARENTESISIZQUIERDO; }
")" { fprintf(yyout, ";D:\t)\n"); return TOK_PARENTESISDERECHO; }
"[" { fprintf(yyout, ";D:\t[\n"); return TOK_CORCHETEIZQUIERDO; }
"]" { fprintf(yyout, ";D:\t]\n"); return TOK_CORCHETEDERECHO; }
"{" { fprintf(yyout, ";D:\t{\n"); return TOK_LLAVEIZQUIERDA; }
"}" { fprintf(yyout, ";D:\t}\n"); return TOK_LLAVEDERECHA; }
"=" { fprintf(yyout, ";D:\t=\n"); return TOK_ASIGNACION; }
"+" { fprintf(yyout, ";D:\t+\n"); return TOK_MAS; }
"-" { fprintf(yyout, ";D:\t-");return TOK_MENOS; }
"/" { fprintf(yyout, ";D:\t/\n"); return TOK_DIVISION; }
"*" { fprintf(yyout, ";D:\t*\n"); return TOK_ASTERISCO; }
"&&" { fprintf(yyout, ";D:\t&&\n"); return TOK_AND; }
"||" { fprintf(yyout, ";D:\t||\n"); return TOK_OR; }
"!" { fprintf(yyout, ";D:\t!\n"); return TOK_NOT; }
"==" { fprintf(yyout, ";D:\t==\n"); return TOK_IGUAL; }
"!=" { fprintf(yyout, ";D:\t!=\n"); return TOK_DISTINTO; }
"<=" { fprintf(yyout, ";D:\t<=\n"); return TOK_MENORIGUAL; }
">=" { fprintf(yyout, ">=\n"); return TOK_MAYORIGUAL; }
"<" { fprintf(yyout, "<\n"); return TOK_MENOR; }
">" { fprintf(yyout, ">\n"); return TOK_MAYOR; }

[a-zA-Z][0-9a-zA-Z]* { fprintf(yyout, ";D:\t%s\n", yytext); return TOK_IDENTIFICADOR; }

[0-9]+ { fprintf(yyout, ";D:\t%s\n", yytext); return TOK_CONSTANTE_ENTERA; }

[ \t] {}

[\n] {}

. {return TOK_ERROR; }

%%
