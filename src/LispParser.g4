parser grammar LispParser;

options {
    tokenVocab = LispLexer;
    language   = Java;
}

/*
 * The top-level entry point.
 * A "program" can be many Lisp forms in sequence, ending with EOF.
 */
program
    : form* EOF
    ;

/*
 * A "form" can be:
 *  1) An atomic literal (number, string, symbol, etc.)
 *  2) A quoted/backquoted form
 *  3) A sharp-quoted form (#')
 *  4) A parenthesized list (S-expression)
 */
form
    : atom
    | list
    | quotedForm
    | backQuotedForm
    | sharpQuotedForm
    ;

/*
 * --- ATOMS ---
 */
atom
    : complexNumber
    | realNumber
    | string
    | identifier
    | literalCharacter
    | true
    | null
    ;

complexNumber
    : HashtagC OPEN_PAREN realNumber realNumber CLOSE_PAREN
    ;

realNumber
    : EXPONENT #Exponent
    | RATIO #Ratio
    | FLOAT_NUM #FloatNumber
    | INT #Int
    ;

string
    : STRING
    ;

identifier
    : IDENTIFIER
    ;

literalCharacter
    : LITERAL_CHARACTER
    ;

true
    : TRUE
    ;

null
    : NULL
    ;

/*
 * --- QUOTATIONS ---
 */
quotedForm
    : QUOTE form
    ;

backQuotedForm
    : BACK_QUOTE form
    ;

sharpQuotedForm
    : SHARP_QUOTE form
    ;

/*
 * --- S-EXPRESSIONS ---
 *
 *  NOTE: We add an extra fallback alternative (form+),
 *  so that something like:
 *     ( (lambda (x) ...) 10 20 30 )
 *  can parse as a list of forms where the first one is a lambda expression.
 */
list
    : OPEN_PAREN ( functionCall
                 | specialForm
                 | (form+)              // <--- ADDED
                 )
      CLOSE_PAREN
    ;

/*
 * (someFunction arg1 arg2 ...)
 */
functionCall
    : (FUNCTION_CALL SHARP_QUOTE?)? (functionName|(OPEN_PAREN lambdaExpr CLOSE_PAREN)) form*   #functionNode
    ;

/*
 * Built-in function/macro names or fallback "IDENTIFIER".
 * (No deletions, your existing list is intact.)
 */
functionName
    : IDENTIFIER
    | PLUS
    | INCREMENT
    | DECREMENT
    | MINUS
    | MULTIPLY
    | DIVIDE
    | MODULUS
    | REMINDER
    | EQUAL
    | NOT_EQUAL
    | GREATER_THAN_OR_EQUAL
    | GREATER_THAN
    | LESS_THAN_OR_EQUAL
    | LESS_THAN
    | AND
    | OR
    | XOR
    | NOT
    | LOGICAL_AND
    | LOGICAL_INCLUSIVE_OR
    | LOGICAL_EXCLUSIVE_OR
    | LOGICAL_EQUIVALENCE
    | LOGICAL_NOR
    | ATOM
    | EQUAL_PRE
    | EQ
    | EQL
    | BOUNDP
    | EVENP
    | ODDP
    | ZEROP
    | LISTP
    | NUMBERP
    | SYMBOLP
    | INTEGERP
    | FLOATP
    | REALP
    | COMPLEXP
    | CHARACTERP
    | STRINGP
    | ARRAYP
    | PACKAGEP
    | CONS
    | CAR
    | CDR
    | FIRST
    | APPEND
    | LAST
    | MEMBER
    | MIN
    | MAX
    | SIN
    | COS
    | TAN
    | ACOS
    | ASIN
    | ATAN
    | SINH
    | COSH
    | TANH
    | ACOSH
    | ASINH
    | ATANH
    | EXP
    | EXPT
    | SQRT
    | LOG
    | CONJUGATE
    | ABS
    | GCD
    | LCM
    | ISQRT
    | FLOOR
    | CEILING
    | TRUNCATE
    | ROUND
    | FFLOOR
    | FCEILING
    | FTRUNCATE
    | FROUND
    | FLOAT
    | RATIONAL
    | RATIONALIZE
    | NUMERATOR
    | DENOMINATOR
    | REALPART
    | IMAGPART
    | CHAR_EQUAL
    | CHAR_NOT_EQUAL
    | CHAR_LESS_THAN
    | CHAR_GREATER_THAN
    | CHAR_NOT_GREATER_THAN
    | CHAR_NOT_LESS_THAN
    | STRING_EQUAL
    | STRING_NOT_EQUAL
    | STRING_LESS_THAN
    | STRING_GREATER_THAN
    | STRING_NOT_GREATER_THAN
    | STRING_NOT_LESS_THAN
    | STRING_UPCASE
    | STRING_DOWNCASE
    | STRING_CAPITALIZE
    | STRING_TRIM
    | STRING_LEFT_TRIM
    | STRING_RIGHT_TRIM
    | STRING_LENGTH
    | STRING_SUBSEQ
    | STRING_CHAR
    | STRING_SORT
    | STRING_MERGE
    | STRING_REVERSE
    | STRING_CONCATENATE
    | WRITE
    | WRITE_LINE
    | WRITE_CHAR
    | PRIN1
    | PRINC
    | WRITE_STRING
    | FRESH_LINE
    | FINISH_OUTPUT
    | WRITE_TO_STRING
    | PRIN1_TO_STRING
    | PRINC_TO_STRING
    | PRINT
    | PARSE_INT
    | FORMAT
    | TERMINATE_PRINTING
    | SETF
    ;

/*
 * --- SPECIAL FORMS ---
 */
specialForm
    : setqExpr
    | defunExpr
    | defmacroExpr
    | defvarExpr
    | defparameterExpr
    | defconstantExpr
    | macroletExpr
    | ifExpr
    | whenExpr
    | condExpr
    | caseExpr
    | loopExpr
    | loopForFromToExpr
    | loopForInExpr
    | loopForFromToExpr
    | loopForInExpr
    | doExpr
    | doTimesExpr
    | doListExpr
    | blockExpr
    | returnFromExpr
    | letExpr
    | prognExpr
    | lambdaExpr
    | setfExpr
    | returnClause
    | listExp
    | functionCallSpecial
    ;

listExp
    : LIST form form+
    ;

/*
 * (setf place newvalue) or multiple (setf (place1) val1 (place2) val2) ...
 */
setfExpr
    : SETF (OPEN_PAREN? form CLOSE_PAREN? form)+
    ;

/*
 * A fallback for "special forms" not explicitly listed above:
 */
functionCallSpecial
    : IDENTIFIER form*
    ;

/*
 * (setq VAR expr ...)
 */
setqExpr
    : SETQ (IDENTIFIER form)+
    ;

/*
 * (defun fname (param1 param2 ...) [docstring?] body)
 *
 * We add (STRING)? so we can capture an optional docstring, e.g.:
 *   (defun check-string (str)
 *       "docstring here"
 *       (and ...))
 */
defunExpr
    : DEFINE_FUNCTION IDENTIFIER  parameterList (STRING)? list*  // <--- ADDED
    ;

/*
 * (defmacro mname (params...) body)
 * (unchanged, though you could similarly add (STRING)? if you want docstrings)
 */
defmacroExpr
    : DEFINE_MACRO IDENTIFIER  parameterList (STRING)? bodyForms
    ;

/*
 * (defvar var [initValue [docString]])
 */
defvarExpr
    : DEFVAR IDENTIFIER (form)? (STRING)?
    ;

/*
 * (defparameter var initValue [docString])
 */
defparameterExpr
    : DEFINE_PARAMETER IDENTIFIER form (STRING)?
    ;

/*
 * (defconstant name initValue [docString])
 */
defconstantExpr
    : DEFCONSTANT IDENTIFIER form (STRING)?
    ;

/*
 * (macrolet ((mName (args...) body...) ...) bodyForms)
 */
macroletExpr
    : MACRO_LET OPEN_PAREN macroletDef+ CLOSE_PAREN bodyForms
    ;

macroletDef
    : OPEN_PAREN   parameterList   bodyForms CLOSE_PAREN
    ;

/*
 * (if condition thenExpr elseExpr?)
 */
ifExpr
    : IF form (((THEN|DO)form?)| form form?)
    ;

/*
 * (when condition body1 body2 ...)
 */
whenExpr
    : WHEN form bodyForms
    ;

/*
 * (cond (cond1 forms...) (cond2 forms...) ...)
 */
condExpr
    : COND condClause+
    ;

condClause
    : OPEN_PAREN form bodyForms CLOSE_PAREN
    ;

/*
 * (case key ((val1 val2...) forms...) (otherwise forms...))
 */
caseExpr
    : CASE form caseClause+
    ;

caseClause
    : OPEN_PAREN form bodyForms CLOSE_PAREN
    ;

/*
 * (loop (for x from 1 to 10) (do something) ...)
 * Real 'loop' is huge, but here's a simplified approach.
 */
loopExpr
    : LOOP list*
    ;

loopForFromToExpr
    : LOOP FOR IDENTIFIER FROM form TO form (BY form)? (specialForm | functionCall)* doClause?
    ;

loopForInExpr
        : LOOP FOR IDENTIFIER IN form (specialForm | functionCall)* doClause?
        ;

/*
 * (do forms...)
 */
doClause
    : DO  bodyForms
    ;

/*
 * (return val?)
 */
returnClause
    : RETURN form?
    ;

/*
 * (do ((var init step) ...) (end-test result?) bodyForms...)
 */
doExpr
    : DO OPEN_PAREN (variableClause)* CLOSE_PAREN
      OPEN_PAREN testClause CLOSE_PAREN
      (OPEN_PAREN form* CLOSE_PAREN)*
    ;

variableClause
    : OPEN_PAREN IDENTIFIER form form CLOSE_PAREN
    ;

testClause
    : form (form)?
    ;


/*
 * (dotimes (var count [result]) bodyForms...)
 */

doTimesExpr
    : DO_TIMES OPEN_PAREN IDENTIFIER form CLOSE_PAREN form*  # DotimesNode
    ;


/*
 * (dolist (var list [result]) bodyForms...)
 */
doListExpr
    : DO_LIST OPEN_PAREN IDENTIFIER form CLOSE_PAREN form*
    ;




/*
 * (block blockName forms...)
 */
blockExpr
    : BLOCK IDENTIFIER bodyForms
    ;

/*
 * (return-from blockName form?)
 */
returnFromExpr
    : RETURN_FROM IDENTIFIER form?
    ;

/*
 * (let ((var1 expr1) (var2 expr2)...) bodyForms...)
 */
letExpr
    : (LET|LET_STAR) OPEN_PAREN letBinding* CLOSE_PAREN bodyForms
    ;

letBinding
    : OPEN_PAREN IDENTIFIER form? CLOSE_PAREN
    ;

/*
 * (progn forms...)
 */
prognExpr
    : PROGN bodyForms
    ;

/*
 * (lambda (params...) body...)
 */
lambdaExpr
    : LAMBDA  parameterList  bodyForms
    ;

/*
 * A "bodyForms" is just 0 or more forms in a row, to allow empty function bodies.
 */
bodyForms
    : form+
    ;

/*
 * A parameter list for a function or macro definition:
 *   (arg1 arg2 &optional arg3 &rest restargs &key k1 k2)
 */
parameterList
    : null
    | OPEN_PAREN  IDENTIFIER*  CLOSE_PAREN
    ;
