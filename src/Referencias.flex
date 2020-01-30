//* --------------------------Seccion codigo-usuario ------------------------*/ 

import java_cup.runtime.*;

%% 

/* -----------------Seccion de opciones y declaraciones -----------------*/ 

/* Nombre de la clase generada para el analizadorlexico*/ 

%class analex 
%unicode
/* Posibilitar acceso a la columna y fila actual de analisis*/ 

%line
%column

/* Habilitar la compatibilidad con el interfaz CUP para el generador sintáctico */

%cup

%{ /* Principio Declaraciones */

/* Crear un nuevo objeto java_cup.runtime.Symbol con informacion sobre el token actual sin valor */

private Symbol symbol(int type) {
  return new Symbol(type,yyline,yycolumn); 
}

/* igual con valor */

private Symbol symbol(int type,Object value){ 
  return new Symbol(type,yyline,yycolumn,value); 
} 

%} /* Fin Declaraciones */


%%
/* ------------------------Seccion de reglas lexicas----------------------*/
<YYINITIAL> {
    /* PALABRAS RESERVADAS */ 
    ("Autores") {return symbol(sym.AUTORES);}
    ("Editoriales") {return symbol(sym.EDITORIALES);}
    ("Libros") {return symbol(sym.LIBROS);}
    ("Libro") {return symbol(sym.LIBRO);}


    /* EXPRESIONES REGULARES */
    ([0-9][0-9][0-9][0-9]) {return symbol(sym.ANIO, new Integer (yytext()));} /*Años*/
    (([A-Z]\.)+(" "[A-Z][a-z]+(\-[A-Z][a-z]+)*)+) {return symbol(sym.NAUTOR, yytext());} /*Nombre Autor*/
    (([A-Za-z0-9\-])+(" "([A-Za-z0-9\-])+)*) {return symbol(sym.NOMBRE, yytext());} /*Nombre de Editorial o libro*/

    //(([A-Za-z0-9ÁÉÍÓÚÑáéíóúñ\-])+(" "([A-Za-z0-9ÁÉÍÓÚÑáéíóúñ\-])+)*) {return symbol(sym.NOMBRE, yytext());} /*Nombre de Editorial o libro*/
    //(([A-ZÁÉÍÓÚÑ]\.)+(" "[A-ZÁÉÍÓÚÑ][a-zñáéíóú]+(\-[A-ZÁÉÍÓÚÑ][a-zñáéíóú]+)*)+) {return symbol(sym.NAUTOR, yytext());} /*Nombre Autor*/

    /* SIGNOS */
    (";") {return symbol(sym.PYC);}
    ("{") {return symbol(sym.LLAVEIZQ);}
    ("}") {return symbol(sym.LLAVEDER);}
    (",") {return symbol(sym.COMA);}

    \n|\r|\r\n { }
    (" ") {}
    . {System.out.println("Token No Valido <" +yytext()+ ">linea: " + (yyline+1) + " columna: " + (yycolumn+1));}

}/* fin YYinitial */


