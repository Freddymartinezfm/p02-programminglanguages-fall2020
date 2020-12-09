
/*
# Author Identification Block
#Author 1:	Mr. Freddy Martinez
#Student ID:	*20130721
#E-Mail:	fmartinez@uco.edu
#Course:	CMSC 5023 – Programming Languages
#CRN:		13855, Autumn, 2020
#Project:	p02
#Due:		September 10, 2020
#Project Account Number:	tt160
*/


#ifndef p02lex_h
#define p02lex_h

#include <cstdio>
#include <fstream>
#include <iostream>
#include <string>

using namespace std;

#ifdef __cplusplus
extern "C"
#endif

int yylex(void);
int yyparse();

//--------------------------------------------------------------------
//Class Scan defines the attributes of a Scanner
//--------------------------------------------------------------------

class Scan {
	int code;
	public:
		Scan(FILE* i);
		int Lex(void);	// returns the token code
		int FetchTokenCode(std::ostream &); //Return the code of the most recent token
 		// void StoreTokenCode(int T); //Store the token code.
 		char* FetchTokenSpelling(void); //Return the spelling of the most recent
 		//token
		int lines();
		 
		
};

#endif







