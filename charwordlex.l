%{
	#include<stdio.h>
	int Char=0;
	int symbol=0;
	int num=0;
	int word=0;
	int line=0;
	int total=0;
%}

%%

[a-zA-Z]   		{Char++;}
[0-9]			{num++;}
[\t ]			{word++;}
[\n]			{word++;line++;}
.			{symbol++;}

%%

int main()
{
	yyin=fopen("input_charword.txt","r");
	yylex();
	
	total=Char+symbol+num;

	printf("\n\nFile Contains \n\n");
	printf("\n\tLines   :\t%d",line);
	printf("\n\tCharacters:\t%d",Char);
	printf("\n\tSymbols :\t%d",symbol);
	printf("\n\tNumbers :\t%d",num);
	printf("\n\tWords   :\t%d",word);
	printf("\n\tTotal   :\t%d\n\n",total);
	
	return 0;
}

int yywrap()
{
	return 1;
}
