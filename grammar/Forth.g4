grammar Forth;

fragment DIGIT:
	[0-9] ;

NEWLINE: '\r'* '\n';

WS : [ \t\r\n\f]+ -> skip ;

BLOCK_COMMENT
	: '/*' .*? '*/' -> skip
	;
LINE_COMMENT
	: '//' ~[\r\n]* -> skip
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

expression
	: LITERAL
	| ID
	;

if_stmt:
	'if'
        true_branch+=expression+ 
    'then' ;

if_else_stmt:
	'if' 
        true_branch+=expression+ 
    'else' 
        false_branch+=expression+ 
    'then' ;

do_stmt:
	'do' 
        expressions+=expression+
    'loop' ;

statement:
	if_stmt | if_else_stmt | do_stmt ;

word_def:
	':' ID (expression|statement)+ ';'
	;

variable_def:
	'variable' ID
	;

constant_def:
	LITERAL 'constant' ID
	;

// --------------

class_header:
	'CLASS' ID ;

class_member
	: variable_def
	| word_def ;

class_body:
    class_member+
    ;

class_end:
	'CLASS' ';' ;

class_def: class_header body=class_body* class_end ;

// --------------

definition
	: word_def
	| variable_def
	| constant_def
	| class_def
	;

instruction: expression | definition;
