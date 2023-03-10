%{

// airport_tab.h was generated by bison
#include "flights.tab.h"
#include <string.h>
#include <stdio.h>


%}

/* it give us the option to continue to the next filen */
%option noyywrap 
/* tell as what the number of line */

%option yylineno 

/* exclusive start condition -- deals with C++ style comments */
%x COMMENT 


%%

\<departures> { strcpy (yylval.departures, yytext); return DEPARTURES; } //example for <intial>

[A-Z]{2}[A-Za-z0-9]{1,4} { strcpy (yylval.flightNumber, yytext); return FLIGHTNUMBER; }

((1[0-2]{1})|(0[0-9]{1})):([0-5]{1}[0-9]{1})[ap]\.m\. { 
			char* timeStat = strstr(yytext, "a.m");
			if(timeStat)
	                            yylval.time = AM;
			else
			    yylval.time = PM;

			return TIME;}

\"[A-Za-z][A-Za-z ]*\"  {   strcpy (yylval.airport, yytext+1);
           yylval.airport[strlen(yylval.airport)-1] = '\0';
            return AIRPORT; }

[c][a][r][g][o] { strcpy (yylval.flightType, yytext); return CARGO; }

[f][r][e][i][g][h][t] { strcpy (yylval.flightType, yytext); return FREIGHT; }

[\n\t\r ]+  /* skip white space */

"//"       { BEGIN (COMMENT); }

<COMMENT>.+ /* skip comment */
<COMMENT>\n {  
                BEGIN (0); } /* BEGIN(INTIAL) , end of comment --> resume normal processing */

.          { fprintf (stderr, "unrecognized token %c\n", yytext[0]); }


%%
