grammar Forth;

BLOCK_COMMENT
	: '/*' .*? '*/' -> channel(HIDDEN)
	;
LINE_COMMENT
	: '//' ~[\r\n]* -> channel(HIDDEN)
	;
  
WS : [ \t\r\n\f]+ -> channel(HIDDEN) ;
