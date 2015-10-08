%{
%}
identifier [a-zA-Z][a-zA-Z0-9]*
delim [ \t\n]
white_sp {delim}+
letter [a-z A-Z]
digit [0-9]
%%
{white_sp}	{}
if |
else |
for |
do |
switch |
case |
include |
define |
int |
float |
char |
void |
main |
return |
while { printf("\n %s is a keyword",yytext);}
{identifier}	{ printf("\n %s is an identifier",yytext);}
#.*	{printf("\n %s is a preprocessor directive",yytext);}
%%
int main(int argc,char **argv)
{
if(argc>1)
{
FILE *file;
file=fopen(argv[1],"r");
if(!file)
{
printf("Could not open %s\n",argv[1]);
exit(0);
}
yyin=file;
}
yylex();
printf("\n\n");
return 0;
}
int yywrap()
{
return 1;
}
