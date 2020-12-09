
/*
# Author Identification Block
#Author 1:      Mr. Freddy Martinez
#Student ID:    *20130721
#E-Mail:        fmartinez@uco.edu
#Course:        CMSC 5023 – Programming Languages
#CRN:           13855, Autumn, 2020
#Project:       p02
#Due:           September 10, 2020
#Project Account Number:        tt160
*/

%{
// Standard C and C++ Library Include Files
//--------------------------------------------------------------------
#include <string>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstdio>

//Namespaces
//--------------------------------------------------------------------
using namespace std;
//--------------------------------------------------------------------
// Application Includes
//--------------------------------------------------------------------
#include "p02lex.h"
#include "p02tkn.h"
// Function Prototypes
int TokenMgr(int t); //Token post processing
void TokenPrint(ostream& o, int t);


//Global Variables
//--------------------------------------------------------------------
int cols;
int line;
int size = 52;
static std::string  names [] = {"NULL", "AND", "ARRAY", "BEGAN", "DIV", "DO", "DOWNTO", "ELSE", "END", "FOR","FUNCTION","IF", "MOD", "NOT", "OF", "PROCEDURE", "PROGRAM", "REPEAT", "THEN","TO","UNTIL", "VAR", "WHILE", "OR",  "EQU", "NEQ", "LES","LEQ", "GRT",  "GEQ", "PLUS" , "MINUS", "STAR", "SLASH", "ASSIGN", "LBRACKET", "RBRACKET", "LPAREN", "RPAREN", "LCURLY", "RCURLY","COLON", "SEMICOLON","RANGE", "PERIOD", "COMMA", "APOSTROPHE","INTLIT", "ID", "CHRLIT","ERROR" };

extern int yylineno;
extern char* yytext;

%}

%%
"and"                                           return TokenMgr(AND);
"array"                                         return TokenMgr(ARRAY);
"began"                                         return TokenMgr(BEGAN);
"div"                                           return TokenMgr(DIV);
"do"                                            return TokenMgr(DO);
"downto"                                        return TokenMgr(DOWNTO);
"else"                                          return TokenMgr(ELSE);
"end"                                           return TokenMgr(END);
"for"                                           return TokenMgr(FOR);
"function"                                      return TokenMgr(FUNCTION);
"if"                                            return TokenMgr(IF);
"mod"                                           return TokenMgr(MOD);
"not"                                           return TokenMgr(NOT);
"of"                                            return TokenMgr(OF);
"procedure"                                     return TokenMgr(PROCEDURE);
"program"                                       return TokenMgr(PROGRAM);
"repeat"                                        return TokenMgr(REPEAT);
"then"                                          return TokenMgr(THEN);
"to"                                            return TokenMgr(TO);
"until"                                         return TokenMgr(UNTIL);
"var"                                           return TokenMgr(VAR);
"while"                                         return TokenMgr(WHILE);
"or"                                            return TokenMgr(OR);
"="                                             return TokenMgr(EQU);
"<>"                                            return TokenMgr(NEQ);
"<"                                             return TokenMgr(LES);
"<="                                            return TokenMgr(LEQ);
">"                                             return TokenMgr(GRT);
">="                                            return TokenMgr(GEQ);
'+'                                             return TokenMgr(PLUS);
"-"                                             return TokenMgr(MINUS);
"*"                                             return TokenMgr(STAR);
"/"                                             return TokenMgr(SLASH);
":="                                            return TokenMgr(ASSIGN);
"["                                             return TokenMgr(LBRACKET);
"]"                                             return TokenMgr(RBRACKET);
"("                                             return TokenMgr(LPAREN);
")"                                             return TokenMgr(RPAREN);
"{"                                             return TokenMgr(LCURLY);
"}"                                             return TokenMgr(RCURLY);
":"                                             return TokenMgr(COLON);
";"                                             return TokenMgr(SEMICOLON);
".."                                            return TokenMgr(RANGE);
"."                                             return TokenMgr(PERIOD);
","                                             return TokenMgr(COMMA);
"'"                                             return TokenMgr(APOSTROPHE);
[0-9]+                                          return TokenMgr(INTLIT);    
[_a-zA-Z][_a-zA-Z0-9]*                          return TokenMgr(ID);   
[ \t\n]+                                        ;
[\n]                                            line++;
[/'][a-zA-Z0-9]+[/'] | 	[/'][[a-zA-Z0-9]+[\']]+[/']+		        return TokenMgr(CHRLIT);  
.                    return TokenMgr(ERROR);


%%


//--------------------------------------------------------------------
//Class Lexer implementation
//--------------------------------------------------------------------
//Function TokenMgr processes the token after it has been recognized
//--------------------------------------------------------------------
int yywrap() { return 1;}
int TokenMgr(int t) {
        return t;
}

//--------------------------------------------------------------------
//--------------------------------------------------------------------
// //Constructor Lexer is used to redirect the input file stream from the
//keyboard to input file stream i.

Scan::Scan(FILE *i) { yyin = i;}

int Scan::Lex(void) {
        code = yylex();
        return code;
}

char* Scan::FetchTokenSpelling(void) { return (char*) yytext; }



//Return the code of the most recent token from the int generated from lex
int Scan::FetchTokenCode(ostream& o){
        TokenPrint(o, code);
        
        return code;


        // for (int i = 1; i < size ; i++) {
        //         if (names[i] == names[code - NOTOKEN]){
        //                 std::cout << names[code - NOTOKEN];
        //                 return code;
        //         }
        // }
}

void TokenPrint(ostream& o, int t){
        auto name = names[t -NOTOKEN];
        o << name;

}

//--------------------------------------------------------------------
//Function getLines returns the line number of the most recent token
//--------------------------------------------------------------------
int Scan::lines() { return yylineno; }
//-----------------------End of Lex Definition------------------------