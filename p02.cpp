//----------------------------------------------------------------------
//File p02.cpp processes command line arguments and invokes lex (yylex)
//to find tokens in the input file.
//----------------------------------------------------------------------
/*
# Author Identification Block
#Author 1:      Mr. Freddy Martinez
#Student ID:    *20130721
#E-Mail:        fmartinez@uco.edu
#Course:        CMSC 5023 – Programming Languages
#CRN:           13855, Autumn, 2020
#Project:       p02
#Due:           Septemmmmber 10, 2020
#Project Account Number:        tt160
*/
//C++ include files
//----------------------------------------------------------------------
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <cstdio>
#include <string>
#include <iomanip>

//----------------------------------------------------------------------
//Application include files
//-----------------------------------------------------------------------
#include "p02lex.h"


void LexMgr(FILE* i,ostream& o);

using namespace std;

// Global Variables
//-----------------------------------------------------------------------
//Function LexMgr processes the input file, calls yylex, the scanner, and
//produces the output file.
//-----------------------------------------------------------------------
void LexMgr(FILE* i,ostream& o){
        //TODO create function for logging
        // std::cout << "\nstart: " << class_name << " ";
        Scan lexer(i); //Redirect yylex to read file i instead of
        int t = lexer.Lex();
        while (t > 0) {
                o << setw(10) << "Token Code: " << setw(5) << t << " " ;
                o << setw(10) <<  "Token Name:  " << setw(10);
	     lexer.FetchTokenCode(o) ;
                o << " " <<  setw(10) << "Spelling: " << " '" << lexer.FetchTokenSpelling() << "' ";
                o << std::endl;
                t = lexer.Lex();                 
        }
       
        // while (t > 0) {
        //         std::cout << "Code = "<< t << "  "; 
        //         std::cout << "Name = "<< t << "  "; 
        //         std::cout << "Spelling= " << lexer.FetchSpelling() << " ";
        //         std::cout << "tokencode= " << lexer.FetchTokenCode() << "\n";
        //         t = lexer.Lex();
        // }
}


//-----------------------------------------------------------------------
//Function main processes command line arguments
//-----------------------------------------------------------------------
int main(int argc, char* argv[]) {
        

        try {
                char ifn[255],ofn[255];
                bool p;
                switch (argc) {
                        case 1://no files on the command line
                                cout << "Enter the input file name. ";
                                cin >> ifn;
                                strcpy(ofn, ((string) ifn).replace(((string) ifn).size() - 4, 4, ".trc").c_str());
                                break;
                        case 2:		//if inputting the program call of "$p02 some.pas"
                                strcpy(ifn, argv[1]);
                                //This is to check for whether in the input file is a Pascal .pas 
                                //file
                                p = strstr(ifn, ".pas");
                                if(p){
                                        strcpy(ofn, ((string) ifn).replace(
                                                //renaming the output file to have a .trc extension
                                                ((string) ifn).size() - 4, 4, ".trc").c_str());
                                } else {
                                        cout << "Please enter the correct input Pascal files." << endl;
                                }
                                break;
                        default:
                                // throw CommandLineException(2,argc-1);
                                break;
                        }


                FILE* i=fopen(ifn,"r"); if (!i) { /*throw FileException(ifn)*/ };
                ofstream out(ofn); if (!out) { /* throw FileException(ofn) */ };
                LexMgr(i,out);
                fclose(i);
                out.close();
        } catch ( ... ) {
                cout << endl;
                cout << "Program Terminated!";
                cout << endl;
                cout << "I won't be back!";
                cout << endl;
                exit(EXIT_FAILURE);
                }
                return 0;
}


