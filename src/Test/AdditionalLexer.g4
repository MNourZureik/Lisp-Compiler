lexer grammar AdditionalLexer;

// Input/output functions // LOW Priority
READ: 'read';                                // Read data from a stream
READ_LINE: 'read-line';                      // Read a line of text from a stream
READ_BYTE: 'read-byte';                      // Read a byte from a stream
READ_CHAR: 'read-char';                      // Read a single char from a stream
READ_PRESERVING_WHITESAPCE : 'read-preserving-whitespace'; // Read with skipping whitespace chars
READ_CHAR_NO_HANG :'read-char-no-hang';      // Read a char without waiting for it
READ_FROM_STRING: 'read-from-string';        // Read from string chars
UNREAD_CHAR: 'unread-char';                  // Push back a char onto an input stream so it can be re-read
PEEK_CHAR: 'peek-char';                      // Return the next character to be read from a stream, without removing the stream
CLEAR_INPUT: 'clear-input';                  // Clear any buffered input
LISTEN: 'listen';                            // Check if there is an input in the input stream

// Error Handling Functions // VERY LOW Priority
DEFINE_CONDITION: 'define-condition';        // Define a new condition type
MAKE_CONDITION: 'make-condition';            // Create an instance of a condition
SIGNAL: 'signal';                            // Signal a condition
ERROR: 'error';                              // Signal an error condition
WARN: 'warn';                                // Signal a warning condition
HANDLER_BIND: 'handler-bind';                // Establish condition handlers
HANDLER_CASE: 'handler-case';                // Handle conditions with specific clauses
RESTART_CASE: 'restart-case';                // Establish restarts for condition handling
INVOKE_RESTART: 'invoke-restart';            // Invoke a restart function
IGNORE_ERRORS: 'ignore-errors';              // Execute code while ignoring errors
CERROR: 'cerror';                            // Signal a correctable error
BREAK: 'break';                              // Enter the debugger
ABORT: 'abort';                              // Abort to the top level
CONTINUE: 'continue';                        // Continue from a condition
UNWIND_PROTECT: 'unwind-protect';            // Ensure cleanup forms are executed

// Package Functions    // VERY LOW Priority
MAKE_PACKAGE: 'make-package';                // Create a new package
IN_PACKAGE: 'in-package';                    // Switch to a specified package
FIND_PACKAGE: 'find-package';                // Find a package by name
RENAME_PACKAGE: 'rename-package';            // Rename an existing package
DELETE_PACKAGE: 'delete-package';            // Delete a package
LIST_ALL_PACKAGES: 'list-all-packages';      // List all existing packages
EXPORT: 'export';                            // Export symbols from a package
IMPORT: 'import';                            // Import symbols into a package
USE_PACKAGE: 'use-package';                  // Use another package
UNUSE_PACKAGE: 'unuse-package';              // Stop using a package
PACKAGE_USE_LIST: 'package-use-list';        // List packages used by a package
PACKAGE_USED_BY_LIST: 'package-used-by-list';// List packages that use a package
PACKAGE_NAME: 'package-name';                // Get the name of a package
PACKAGE_NICKNAMES: 'package-nicknames';      // Get the nicknames of a package
PACKAGE_SHADOWING_SYMBOLS: 'package-shadowing-symbols'; // Get shadowing symbols of a package
PACKAGE_LOCKED_P: 'package-locked-p';        // Check if a package is locked
PACKAGE_LOCK: 'package-lock';                // Lock a package
PACKAGE_UNLOCK: 'package-unlock';            // Unlock a package


// Common Lisp Object System (CLOS) Functions   // VERY LOW Priority
DEFCLASS: 'defclass';                        // Define a new class
DEFMETHOD: 'defmethod';                      // Define a method for a generic function
DEFGENERIC: 'defgeneric';                    // Define a generic function
MAKE_INSTANCE: 'make-instance';              // Create an instance of a class
SLOT_VALUE: 'slot-value';                    // Access the value of a slot in an instance
WITH_SLOTS: 'with-slots';                    // Establish lexical bindings for slots
WITH_ACCESSORS: 'with-accessors';            // Establish lexical bindings for accessors
CHANGE_CLASS: 'change-class';                // Change the class of an instance
FIND_CLASS: 'find-class';                    // Retrieve a class object by name
CLASS_OF: 'class-of';                        // Determine the class of an object
GENERIC_FUNCTION: 'generic-function';        // Retrieve the generic function object
METHOD_COMBINATION: 'method-combination';    // Specify method combination for a generic function

// Set Operations Functions // VERY LOW Priority
UNION: 'union';                              // Return the union of two sets
INTERSECTION: 'intersection';                // Return the intersection of two sets
SET_DIFFERENCE: 'set-difference';            // Return the difference between two sets
SET_EXCLUSIVE_OR: 'set-exclusive-or';        // Return the symmetric difference of two sets
SUBSETP: 'subsetp';                          // Test if one set is a subset of another
ADJOIN: 'adjoin';                            // Destructively remove elements from a set


// File Input/Output (I/O) Functions // VERY LOW Priority
OPEN: 'open';                                // Open a file stream
CLOSE: 'close';                              // Close a file stream
WITH_OPEN_FILE: 'with-open-file';            // Execute code with an open file stream
FILE_POSITION: 'file-position';              // Get or set the position within a file
FILE_LENGTH: 'file-length';                  // Get the length of a file
FILE_EXISTS_P: 'file-exists-p';              // Check if a file exists
DELETE_FILE: 'delete-file';                  // Delete a file
RENAME_FILE: 'rename-file';                  // Rename a file
PROBE_FILE: 'probe-file';                    // Check for the existence of a file
FILE_WRITE_DATE: 'file-write-date';          // Get the last modification date of a file


// Structures   // VERY LOW Priority
DEFSTRUCT: 'defstruct';                       // Define a new structure type.


// Vector constructor // VERY LOW Priority
MAKE_VECTOR: 'make-vector';                   // Create a new vector with a specified size and optional initial value.
VECTORP: 'vectorp';                           // Check if an object is a vector.
VECTOR_PUSH: 'vector-push';                   // Add an element to the end of a vector (resize).
VECTOR_POP: 'vector-pop';                     // Remove and return the last element of a vector.

// Vectors // VERY LOW Priority
VECTOR: 'vector';                            // Vector constructor
//NUMBER_SEQUENCE: '#' OPEN_PAREN WS? (NUMBER (WS NUMBER)*)? WS? CLOSE_PAREN;
SORT: 'sort';
MERGE: 'merge';
REMOVE: 'remove';
DELETE: 'delete';

// Tree : // VERY LOW Priority
COPY_TREE: 'copy-tree';                      // Done
TREE_EQUAL: 'tree-equal';                    // Done
SUB_TREE:'subst';                            // Done
NSUB_TREE:'nsubst';                          // Done
SUBLIS_TREE:'sublis';                          // Done
NSUBLIS_TREE:'nsublis';                          // Done

// Hash Table : // VERY LOW Priority
MAKE_HASH_TABLE: 'make-hash-table';     // Done // make-hash-table &key :test :size :rehash-size :rehash-threshold
/*
    The key argument provides the key.
    The :test argument determines how keys are compared - it should have one of three values #'eq, #'eql, or #'equal, or one of the three symbols eq, eql, or equal. If not specified, eql is assumed.
    The :size argument sets the initial size of the hash table. This should be an integer greater than zero.
    The :rehash-size argument specifies how much to increase the size of the hash table when it becomes full. This can be an integer greater than zero, which is the number of entries to add, or it can be a floating-point number greater than 1, which is the ratio of the new size to the old size. The default value for this argument is implementation-dependent.
    The :rehash-threshold argument specifies how full the hash table can get before it must grow. This can be an integer greater than zero and less than the :rehash-size (in which case it will be scaled whenever the table is grown), or it can be a floating-point number between zero and 1. The default value for this argument is implementation-dependent.
*/
GET_HASH:'gethash';                     // Done // gethash key hash-table &optional default
/*
    key: is the associated key
    hash-table: is the hash-table to be searched
    default: is the value to be returned, if the entry is not found, which is nil, if not specified.
*/
REMOVE_HASH_ELEMENT:'remhash';           // Done // removes any entry for a specific key in hash-table
MAP_HASH:'maphash';                      // Done =>
// It takes two arguments - the function and a hash table and invokes the function once for each key/value pair in the hash table.
// LIKE => (maphash #'(lambda (k v) (format t "~a => ~a~%" k v)) empList)

//HASH_ARGUMENTS:':test' | ':size' | ':rehash-size' | ':rehash-threshold';  // Done


// Symbols : // VERY LOW Priority
GET:'get';                                  // Decalre a symbol . // Done
//SYMBOL: QUOTE LETTER+;                      // symbol naming rules . // Done
SYMBOL_PLIST:'symbol-plist';                // viewing the symbol properties and its value according to each other // Done
REMOVE_PROPERTY_FROM_SYMBO: 'remprop';      // removing speciefied property . // Done


// Data structures // VERY LOW Priority
SETF: 'setf';                                // Set field value // Done
MAKE_ARRAY: 'make-array';                    // Create an array // Done
AREF: 'aref';                                // Array element access // Done
INITIAL_CONTENTS: ':initial-contents';       // Initial contents of array  // Done
INITIAL_ELEMENT: ':initial-element';         // Initial element of array // Done
DISPLACED_TO: ':displaced-to';               // Displaced array // Done
ADJUSTABLE: ':adjustable';                   // Adjustable array flag // Done
FILL_POINTER: ':fill-pointer';               // Fill pointer for arrays // Done
DISPLACED_INDEX_OFFSET: ':displaced-index-offset'; // Index offset for displaced arrays // Done
ELEMENT_TYPE: ':element-type';               // Type of elements in array // Done
MAKE_SEQUENCE: 'make-sequence';              // Create a Sequence // Done
//SEQUENCE_LENGTH:'length';                  // Done
SEQUENCE_ELT: 'elt';                         // Done
//SEQUENCE_SUB: 'subseq';                    // Done
SEQUENCE_COPY: 'copy-seq';// Done
SEQUENCE_FILL:'fill';// Done
SEQUENCE_COUNT:'count';// Done
SEQUENCE_REPLACE:'replace';// Done
//SEQUENCE_REVERSE:'reverse';// Done
SEQUENCE_NREVERSE:'nreverse';// Done
//SEQUENCE_CONCATENATE:'concatenate'// Done
SEQUENCE_POSITION:'position';// Done
SEQUENCE_FIND:'find';// Done
//SEQUENCE_SORT:'sort';// Done
//SEQUENCE_MERGE:'merge';// Done
SEQUENCE_MAP:'map';// Done
SEQUENCE_SOME:'some';// Done
SEQUENCE_EVERY:'every';// Done
SEQUENCE_NOTANY:'notany';// Done
SEQUENCE_NOTEVERY:'notevery';// Done
SEQUENCE_REDUCE:'reduce';// Done
SEQUENCE_SEARCH:'search';// Done
//SEQUENCE_REMOVE:'remove';// Done
//SEQUENCE_DELETE:'delete';// Done
SEQUENCE_SUBSTITUTE:'substitute';// Done
SEQUENCE_NSUBSTITUTE:'nsubstitute';// Done
SEQUENCE_MISMATCH:'mismatch';// Done
SEQUENCE_DELETE_IF:'delete-if';// Done
SEQUENCE_REMOVE_IF:'remove-if';// Done
//SEQUENCE_SORT:'sort';// Done
//SEQUENCE_MERGE:'merge';// Done
SEQUENCE_TEST: ':test' ;// Done
SEQUENCE_KEY_ARG: ':key' ;// Done
SEQUENCE_START_ARG: ':start' ;// Done
SEQUENCE_END_ARG: ':end' ;// Done
SEQUENCE_FROM_END_ARG: ':from-end' ;// Done
SEQUENCE_COUNT_ARG: ':count' ;// Done


// DATA STRUCTURE ARGUMENTS :
//ARGUMENTS: ':'LETTER+;
//SYMBOL: (LETTER | SYMBOL_CHAR)+ ;