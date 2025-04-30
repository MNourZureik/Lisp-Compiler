lexer grammar LispLexer;

// Single-character tokens
OPEN_PAREN: '(';                     // Opening parenthesis // Done
CLOSE_PAREN: ')';                    // Closing parenthesis // Done
QUOTE: '\'';                         // Quote symbol // Done // printing the sentense after it as it was written .
BACK_QUOTE: '`';                     //  // Done // printing the sentense after it as it was written .
fragment DOT: '.';                            // Dot symbol
fragment COMMA: ',';                          // Comma
fragment COMMA_AT: ',@';                      // Comma at-sign for splicing
fragment DOUBLE_QOUTE: '"';
fragment SLASH: '\\';
fragment Hashtag: '#';
SHARP_QUOTE: Hashtag QUOTE;                  // Function quote                            // Function quote // Done

// String literals
STRING: DOUBLE_QOUTE ( ~["\\] | '\\' . )* DOUBLE_QOUTE
    {
       String theString = getText();
       int firstLetter = 1;
       int lastLetter = theString.length() -1;
       String theNewString = theString.substring(firstLetter,lastLetter).replaceAll("\\\\(.)", "$1");;
       setText(theNewString);
    };  // Double-quoted strings with escape sequences // Done

// Character literals // HIGH Priority
LITERAL_CHARACTER: Hashtag SLASH (LETTER | NAMED_CHARACTER)         // Character literals starting with #\
    {
       String theString = getText();
       int firstLetter = 2;
       String theNewString = theString.substring(firstLetter);
       setText(theNewString);
    };

// HIGHT Priority
INCREMENT: 'incf';                   // Done //(setq A 10) Incf A 4 => output = 14
DECREMENT: 'decf';                   // Done //(setq A 10) decf A 4 => output = 6
//(ID)(ID|NUM)?

// Arithmetic operators // HIGH Priority
PLUS: '+';                           // Addition operator // Done
MINUS: '-';                          // Subtraction operator // Done
MULTIPLY: '*';                       // Multiplication operator // Done
DIVIDE: '/';                         // Division operator // Done
MODULUS: 'mod';                      // Modulus operator // Done // takes the sign of second number // mod 10 -3 = -2
REMINDER: 'rem';                     // Remainder operator // Done // takes the sign of first number // mod 10 -3 = 1
// Comparison operators // HIGHT Priority
EQUAL: '=';                          // Equality operator // Done
NOT_EQUAL: '/=';                     // Not equal operator // Done
GREATER_THAN_OR_EQUAL: '>=';         // Greater than or equal operator // Done
GREATER_THAN: '>';                   // Greater than operator // Done
LESS_THAN_OR_EQUAL: '<=';            // Less than or equal operator // Done
LESS_THAN: '<';                      // Less than operator // Done
// Logical operators    // HIGHT Priority
AND: 'and';                          // Logical AND // Done
OR: 'or';                            // Logical OR // Done
XOR: 'xor';                          // Logical XOR // Done
NOT: 'not';                          // Logical NOT // Done
// Bitwise operators // LOW Priority
LOGICAL_AND: 'logand';               // Bitwise AND // Done
LOGICAL_INCLUSIVE_OR: 'logior';      // Bitwise inclusive OR // Done
LOGICAL_EXCLUSIVE_OR: 'logxor';      // Bitwise exclusive OR // Done
LOGICAL_EQUIVALENCE: 'logeqv';       // Bitwise equivalence // Done
LOGICAL_NOR: 'lognor';               // Bitwise NOR // Done
// Predicates checkers : // LOW Priority
ATOM: 'atom';                        // Atom predicate // Done
EQUAL_PRE: 'equal';                  // Equality predicate // Done
EQ: 'eq';                            // Identity predicate // Done
EQL: 'eql';                          // Equality predicate for numbers // Done
BOUNDP: 'boundp';                    // Check if variable is defined // Done
EVENP: 'evenp';                      // Check if number is even // Done
ODDP: 'oddp';                        // Check if number is odd // Done
ZEROP: 'zerop';                      // Check if number is zero // Done
LISTP: 'listp';                      // Check if object is a list // Done
NUMBERP: 'numberp';                  // Check if object is a number // Done
SYMBOLP: 'symbolp';                  // Check if object is a symbol // Done
INTEGERP: 'integerp';                // Check if object is an integer // Done
FLOATP: 'floatp';                    // Check if object is a float // Done
REALP: 'realp';                      // Check if object is a real number // Done
COMPLEXP: 'complexp';                // Check if object is complex // Done
CHARACTERP: 'characterp';            // Check if object is a character // Done
STRINGP: 'stringp';                  // Check if object is a string // Done
ARRAYP: 'arrayp';                    // Check if object is an array // Done
PACKAGEP: 'packagep';                // Check if object is a package // Done

// Control flow keywords  // HIGHT Priority
COND: 'cond';                        // Conditional // Done
IF: 'if';                            // If statement // Done
THEN: 'then';                        // Then clause RELATED TO IF KEYWORD // Done
WHEN: 'when';                        // When clause // Done
CASE: 'case';                        // Case statement // Done

// Looping constructs   // HIGHT Priority
FOR: 'for';                          // For loop // Done
IN: 'in';                            // In keyword // Done
FROM: 'from';                        // From keyword // Done
TO: 'to';                            // To keyword // Done
BY: 'by';
WHILE: 'while';                      // While loop // Done
LOOP: 'loop';                        // Loop construct // Done
RETURN: 'return';                    // Return statement // Done
DO: 'do';                            // Do loop // Done
DO_TIMES: 'dotimes';                 // Do times loop // Done
DO_LIST: 'dolist';                   // Do list loop // Done
BLOCK: 'block';                      // Block construct // Done // declare scope with name
RETURN_FROM: 'return-from';          // Return from block // Done // take a block name and an optional

// Macro definitions // LOW Priority
DEFINE_MACRO: 'defmacro';            // Define macro
DEFINE_PARAMETER: 'defparameter';    // Define parameter
MACRO_LET: 'macrolet';               // Local macro definitions

// Function definitions // HIGH Priority
KEY_PARAMETER: ':' IDENTIFIER;
DEFINE_FUNCTION: 'defun';            // Define function // Done
OPTIONAL: '&optional';               // Optional parameter // Done
REST: '&rest';                       // Rest parameter // Done // declare one variable as list as parameter for function .
KEY: '&key';                         // Keyword parameters // Done //for making named variables
LIST: 'list';                        // List constructor // Done
FUNCTION_CALL: 'funcall';            // Function call // Done //(funcall #'function-name arg1 arg2)

/*
    (define x 42)          ; Define a variable
    (define (square x) (* x x)) ; Define a function
*/
LET_STAR: 'let*';                    // Sequential bindings // Done
/*
    (let* ((x 10)
           (y (+ x 5)))  ; y depends on x
    (+ x y))           ; => 25
*/
BEGIN: 'begin';                      // Begin block // Done // begin is used to group multiple expressions into a single block
LAMBDA: 'lambda';                    // Lambda function // Done // declare anonymous function
MAPCAR: 'mapcar';                    // Mapcar function // Done // declare operation on a list like : mapcar '+ '(3 , 5) '(5 , 3) => output = (8 , 8)
SETQ: 'setq';                        // Set variable value // Done // used for assign or update the value of existing variable or create dynamic variable for scope usage
SETF: 'setf';
LET: 'let';                          // Local variable binding // Done // declare more than 1 variable in the same time and initialize them with symbols.
PROGN: 'progn';                        // Done // decalre more than one variable and initialize them with blocks .

// Type and variable declarations   // HIGH Priority
TYPEP: 'typep';                        // Type keyword
TYPE_OF: 'type-of';                  // Get type of expression
DEFVAR: 'defvar';                    // Define global variable
DEFCONSTANT: 'defconstant';          // Define constant

// Math functions // LOW Priority
MIN: 'min';                          // return the minimum // Done
MAX: 'max';                          // return the maximum // Done
SIN: 'sin';                          // Sine function // Done
COS: 'cos';                          // Cosine function // Done
TAN: 'tan';                          // Tangent function // Done
ACOS: 'acos';                        // Arc cosine function // Done
ASIN: 'asin';                        // Arc sine function // Done
ATAN: 'atan';                        // Arc tangent function // Done
SINH: 'sinh';                        // Hyperbolic sine function // Done
COSH: 'cosh';                        // Hyperbolic cosine function // Done
TANH: 'tanh';                        // Hyperbolic tangent function // Done
ACOSH: 'acosh';                      // Hyperbolic arc cosine function // Done
ASINH: 'asinh';                      // Hyperbolic arc sine function // Done
ATANH: 'atanh';                      // Hyperbolic arc tangent function // Done
EXP: 'exp';                          // Exponential function // Done
EXPT: 'expt';                        // Exponentiation function // Done
SQRT: 'sqrt';                        // Square root function // Done
LOG: 'log';                          // Logarithm function // Done
CONJUGATE: 'conjugate';              // Complex conjugate // Done
ABS: 'abs';                          // Absolute value // Done
GCD: 'gcd';                          // Greatest common divisor // Done
LCM: 'lcm';                          // Least common multiple // Done
ISQRT: 'isqrt';                      // Integer square root // Done
FLOOR: 'floor';                      // Floor function // Done
CEILING: 'ceiling';                  // Ceiling function // Done
TRUNCATE: 'truncate';                // Truncate function // Done
ROUND: 'round';                      // Round function // Done
FFLOOR: 'ffloor';                    // Float floor function // Done
FCEILING: 'fceiling';                // Float ceiling function // Done
FTRUNCATE: 'ftruncate';              // Float truncate function // Done
FROUND: 'fround';                    // Float round function // Done
FLOAT: 'float';                      // Convert to float // Done
RATIONAL: 'rational';                // Convert to rational // Done
RATIONALIZE: 'rationalize';          // Rational approximation // Done
NUMERATOR: 'numerator';              // Numerator of rational // Done
DENOMINATOR: 'denominator';          // Denominator of rational // Done
REALPART: 'realpart';                // Real part of complex // Done
IMAGPART: 'imagpart';                // Imaginary part of complex // Done

// Character comparison functions   // LOW Priority
CHAR_EQUAL: 'char=' | 'char-equal';  // Character equality
CHAR_NOT_EQUAL: 'char/=' | 'char-not-equal'; // Character inequality
CHAR_LESS_THAN: 'char<' | 'char-lessp';      // Character less than
CHAR_GREATER_THAN: 'char>' | 'char-greaterp';// Character greater than
CHAR_NOT_GREATER_THAN: 'char<=' | 'char-not-greaterp'; // Character not greater than
CHAR_NOT_LESS_THAN: 'char>=' | 'char-not-lessp'; // Character not less than

// String functions // LOW Priority
STRING_EQUAL: 'string=' | 'string-equal';    // String equality // Done
STRING_NOT_EQUAL: 'string/=' | 'string-not-equal'; // String inequality // Done
STRING_LESS_THAN: 'string<' | 'string-lessp';      // String less than // Done
STRING_GREATER_THAN: 'string>' | 'string-greaterp';// String greater than // Done
STRING_NOT_GREATER_THAN: 'string<=' | 'string-not-greaterp'; // String not greater than // Done
STRING_NOT_LESS_THAN: 'string>=' | 'string-not-lessp'; // String not less than // Done
STRING_UPCASE: 'string-upcase';              // Convert string to uppercase // Done
STRING_DOWNCASE: 'string-downcase';          // Convert string to lowercase // Done
STRING_CAPITALIZE: 'string-capitalize';      // Capitalize string // Done
STRING_TRIM: 'string-trim';                  // Trim characters from string // Done
STRING_LEFT_TRIM: 'string-left-trim';        // Trim characters from left // Done
STRING_RIGHT_TRIM: 'string-right-trim';      // Trim characters from right // Done
STRING_LENGTH: 'length';                     // Get string length // Done
STRING_SUBSEQ: 'subseq';                     // Get substring // Done
STRING_CHAR: 'char';                         // Get character from string // Done
STRING_SORT: 'sort';                         // Sort string // Done
STRING_MERGE: 'merge';                       // Merge strings // Done
STRING_REVERSE: 'reverse';                   // Reverse string // Done
STRING_CONCATENATE: 'concatenate';           // Concatenate strings // Done

// Output functions // HIGH Priority
WRITE: 'write';                              // Write to output
WRITE_LINE: 'write-line';                    // Write line to output
WRITE_CHAR: 'write-char';                    // Write character to output
PRIN1: 'prin1';                              // Write in a readable Lisp format.
PRINC: 'princ';                              // Write in a human-readable format (no quotes).
WRITE_STRING: 'write-string';                // Write a string without extra formatting.                         // Write a newline.
FRESH_LINE: 'fresh-line';                    // Ensure output starts on a fresh line.
FINISH_OUTPUT: 'finish-output';              // Flush buffered output.
WRITE_TO_STRING: 'write-to-string';          // Serialize object to a string.
PRIN1_TO_STRING: 'prin1-to-string';          // Serialize object in readable Lisp format.
PRINC_TO_STRING: 'princ-to-string';          // Serialize object in human-readable format.
PRINT: 'print';                              // Print to output
PARSE_INT: 'parse-integer';                  // Examines the substring of string
FORMAT: 'format';                            // Formatted output
TERMINATE_PRINTING: 'terpri';                // Terminate printing (newline)

// List creation functions
CONS: 'cons';                                // Construct a new cons cell

// List access functions
CAR: 'car';                                  // Retrieve the first element of a list
CDR: 'cdr';                                  // Retrieve the rest of the list after the first element
FIRST: 'first';                              // Alias for 'car'

// List manipulation functions
APPEND: 'append';                            // Concatenate multiple lists
LAST: 'last';                                // Retrieve the last element of a list
MEMBER: 'member';                            // Check if an element is a member of a list

// Identifiers and symbols

NULL: 'nil' | '(' WS* ')';                   // boolean false // Done
TRUE: 't';                              // Boolean true // Done
PERIODS: '.'+;

// Number tokens // HIGH Priority
INT: (PLUS | MINUS)? DIGIT+;         // Integer with optional sign // Done // positive and negative normal numbers
RATIO: INT DIVIDE INT;
FLOAT_NUM: (PLUS | MINUS)? ((DOT DIGIT+)|(DIGIT+ DOT)|(DIGIT+ DOT DIGIT+)); // Floating-point number with optional sign // Done // positive and negative Decimal numbers
EXPONENT: (FLOAT_NUM | INT) [eE] INT; // Exponent notation // Done
HashtagC: Hashtag [cC];                        // defining complex numbers like : #c(1 , 2) mean (1 + 2i) // Done

//IDENTIFIER:(LETTER | SYMBOL_CHAR | DIGIT | ACCEPTED_SPECIAL_CHAR)+ ?? (NULL | TRUE | NUMBER | DOT_CHAR);
IDENTIFIER: (ESC_SEQ | ALLOWED_CHAR)+
    {
        String theString = getText();
        String theNewString = theString.replaceAll("\\\\(.)", "$1");
        setText(theNewString);
    }
    ;
fragment ESC_SEQ
    : '\\' .
    ;
fragment ALLOWED_CHAR
    : ~[ \t\r\n()"'\\,:;|]
    ;

fragment SYMBOL_CHAR: [+\-/*<>=!?_$@&.];

fragment LETTER: [a-zA-Z] ;

fragment DIGIT: [0-9];

fragment NAMED_CHARACTER
    : 'Backspace'
    | 'Tab'
    | 'Linefeed'
    | 'Page'
    | 'Return'
    | 'Rubout'
    ;

// Comments and whitespace
COMMENT: ';' ~[\r\n]* -> skip;               // Single-line comments // Done // ignoring comment using skip
WS: [ \r\n\t]+ -> skip;                      // Whitespace // Done // ignoring white space using skip