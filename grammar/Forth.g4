grammar Forth;

fragment DIGIT:
	[0-9] ;

NEWLINE: '\r'* '\n';

WS : [ \t\r\n\f]+ -> channel(HIDDEN) ;

BLOCK_COMMENT
	: '/*' .*? '*/' -> channel(HIDDEN)
	;
LINE_COMMENT
	: '//' ~[\r\n]* -> channel(HIDDEN)
	;

INTEGER
	: '-'? DIGIT+ ;
	
DOUBLE
	: '-'? DIGIT+ '.' DIGIT+ ([Ee] [+-]? DIGIT+)? ;

STRING
	: '"' ('\\' (~'\\'|'\\')? | ~[\\"] )* '"' ;

LITERAL
	: INTEGER
	| DOUBLE
	| STRING
	;

ID: [\p{Alpha}\p{General_Category=Other_Letter}] [\p{Alnum}\p{General_Category=Other_Letter}]* ;

expression:
	(LITERAL|ID) (WS (LITERAL | ID))+ ;

if_stmt:
	'if' expression 'then' ;

if_else_stmt:
	'if' expression 'then' expression 'else' expression 'then' ;

do_stmt:
	'do' expression 'loop' ;

statement:
	if_stmt | if_else_stmt | do_stmt ;