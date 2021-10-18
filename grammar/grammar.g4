grammar Forth;

fragment DIGIT:
	[0-9] ;

INTEGER
	: '-'? DIGIT+ ;
	
DOUBLE
	: '-'? DIGIT+ '.' DIGIT+ ([Ee] [+-]? DIGIT+)? ;

STRING:
	: '"' ('\\' (~'\\'|'\\')? | ^[\\"] )* '"'

LITERAL
	: INTEGER
	: DOUBLE
	| STRING
	;

BLOCK_COMMENT
	: '/*' .*? '*/' -> channel(HIDDEN)
	;
LINE_COMMENT
	: '//' ~[\r\n]* -> channel(HIDDEN)
	;
  
WS : [ \t\r\n\f]+ -> channel(HIDDEN) ;
