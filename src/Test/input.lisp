; print the Hello World \n \r
(write-line "Hello World")
; print the statement
(write-line "I am at 'Tutorials Point'! Learning LISP")
(+ 7 9 11)
(write (+ 7 9 11))
(write(+ (* (/ 9 5) 60) 32))
(write-line "single quote used, it inhibits evaluation")
(write '(* 2 3))
(write-line " ")
(write-line "single quote not used, so expression evaluated")
(write (* 2 3))
; set values to variables
(setq x 10)
(setq y 34.567)
(setq ch nil)
(setq n 123.78)
(setq bg 11.0e+4)
(setq r 124/2)
; print values of variables
(print x)
(print y)
(print n)
(print ch)
(print bg)
(print r)
; define variables and set values
(defvar x 10)
(defvar y 34.567)
(defvar ch nil)
(defvar n 123.78)
(defvar bg 11.0e+4)
(defvar r 124/2)
(defmacro setTo10 (num)
(setq num 10)(print num))
(setq x 25)
(print x)
(setTo10 x)
(defmacro setValue(num1 num2 value)
(progn
	(setq num1 value)
	(setq num2 value))
	(print num1)
    (print num2)
)
; define paramters
(defparameter num1 1)
(defparameter num2 2)
; print the paramters before macroo
(print "Values: ")
(print num1)
(print num2)
; print parameters in macros
(print "Values within macro: ")
(setValue num1 num2 3)
; print parameters after running macro, values will be unaffected
(print "Values after macro: ")
(print num1)
(print num2)
(defvar x 234)
(write x)
(setq x 10)
(setq y 20)
(format t "x = ~2d y = ~2d ~%" x y )
(setq x 100)
(setq y 200)
(format t "x = ~2d y = ~2d" x y)
(let ((x 'a) (y 'b)(z 'c))
(format t "x = ~a y = ~a z = ~a" x y z))
;(prog ((x '(a b c))(y '(1 2 3))(z '(p q 10)))
;(format t "x = ~a y = ~a z = ~a" x y z) )
(defconstant PI 3.141592)
; define a constant PI as 3.141592
(defconstant PI 3.141592)
; define a function area-circle
(defun area-circle(rad)
   ; terminate current printing
   (terpri)
   ; print the redius
   (format t "Radius: ~5f" rad)
   ; print the area
   (format t "~%Area: ~10f" (* PI rad rad)))
; call the area-cirlce function with argument as 10
(area-circle 10)
; define a constant PI as 3.141592
(defconstant PI 3.141592)
; check if PI constant is defined
(write (boundp 'PI))  ; prints T
; terminate printing
(terpri)
; check if OMEGA constant is defined
(write (boundp 'OMEGA))  ; prints Nil
; set a as 10
(setq a 10)
; check a being greater than 20
(cond ((> a 20)
   (format t "~% a is greater than 20"))  ; statement is not printed as case is not true
   (t (format t "~% value of a is ~d " a))) ; otherwise print the statement
; set a as 10
(setq a 10)
; check if a is greater than 20
(if (> a 20)
   ; print the result if a is less than 20
   (format t "~% a is less than 20"))
; print the value of a
(format t "~% value of a is ~d " a)
; set a as 10
(setq a 10)
; check if a is greater than 20
(if (> a 20)
   ; print statement if a is greater than 20
   then (format t "~% a is less than 20"))
; print value of a
(format t "~% value of a is ~d " a)
; set a as 100
(setq a 100)
; if a is greater than 20
(if (> a 20)
   ; print statement if a is greater than 20
   (format t "~% a is greater than 20")
   ; else print this statement
   (format t "~% a is less than 20"))
(format t "~% value of a is ~d " a)
(setq a 100)
(when (> a 20)
   (format t "~% a is greater than 20"))
(format t "~% value of a is ~d " a)
(setq a 10)
(when (> a 20)
   (format t "~% a is greater than 20"))
(format t "~% value of a is ~d " a)
; set day as 4
(setq day 4)
; compare day with corresponding cases and print the respective day
(case day
   (1 (format t "~% Monday"))
   (2 (format t "~% Tuesday"))
   (3 (format t "~% Wednesday"))
   (4 (format t "~% Thursday"))
   (5 (format t "~% Friday"))
   (6 (format t "~% Saturday"))
   (7 (format t "~% Sunday")))
; set a as 2
(setq a 2)
; set b as 3
(setq b 3)
; set c as 3 to represent a case for multiplication
(setq c 3)
; compare c with corresponding cases and print the respective operation result
(case c
   (1 (print (+ a b)))  ; get sum
   (2 (print (- a b)))  ; get substraction
   (3 (print (* a b)))  ; get multiplication
   (4 (print (/ a b))))  ; get division
; set a as 60
(setq a 60)
; set b as 13
(setq b 13)
; print logand of a and b
(format t "~% BITWISE AND of a and b is ~a" (logand a b))
; print logand of a or b
(format t "~% BITWISE INCLUSIVE OR of a and b is ~a" (logior a b))
; terminate printing to print in new line
(terpri)
; assign variables new values
(setq a 10)
(setq b 0)
(setq c 30)
(setq d 40)
; print logand of all four variables
(format t "~% Result of bitwise and operation on 10, 0, 30, 40 is ~a" (logand a b c d))
; print logor of all four variables
(format t "~% Result of bitwise or operation on 10, 0, 30, 40 is ~a" (logior a b c d))
; set a as 60
(setq a 60)
; set b as 13
(setq b 13)
; print logxor of a and b
(format t "~% BITWISE EXCLUSIVE OR of a and b is ~a" (logxor a b))
; print lognor of a and b
(format t "~% A NOT B is ~a" (lognor a b))
; terminate printing to print in new line
(terpri)
; assign variables new values
(setq a 10)
(setq b 0)
(setq c 30)
(setq d 40)
; print logxor of all four variables
(format t "~% Result of bitwise xor operation on 10, 0, 30, 40 is ~a" (logxor a b c d))
; print logeqv of all four variables
(format t "~% Result of bitwise eqivalance operation on 10, 0, 30, 40 is ~a" (logeqv a b c d))
; set a as 60
(setq a 60)
; set b as 13
(setq b 13)
; print logeqv of a and b
(format t "~% A EQUIVALANCE B is ~a" (logeqv a b))
; terminate printing to print in new line
(terpri)
; assign variables new values
(setq a 10)
(setq b 0)
(setq c 30)
(setq d 40)
; print logeqv of all four variables
(format t "~% Result of bitwise eqivalance operation on 10, 0, 30, 40 is ~a" (logeqv a b c d))
; set a as 10
(setq a 10)
; set b as 20
(setq b 20)
; perform and operation on a and b
(format t "~% A and B is ~a" (and a b))
; terminate printing
(terpri)
; set a as nil
(setq a nil)
; set b as 5
(setq b 5)
; perform and operation on a and b
(format t "~% A and B is ~a" (and a b))
; terminate printing
(terpri)
; set a as nil
(setq a nil)
; set b as 0
(setq b 0)
; perform and operation on a and b
(format t "~% A and B is ~a" (and a b))
; terminate printing
(terpri)
; set values to variables
(setq a 10)
(setq b 0)
(setq c 30)
(setq d 40)
; print and operation on all four variables
(format t "~% Result of and operation on 10, 0, 30, 40 is ~a" (and a b c d))
; terminate printing
(terpri)
; set values to variables
(setq a 10)
(setq b 20)
(setq c nil)
(setq d 40)
; print and operation on all four variables
(format t "~% Result of and operation on 10, 20, nil, 40 is ~a" (and a b c d))
; set a as 10
(setq a 10)
; set b as 20
(setq b 20)
; print or operation on a and b
(format t "~% A or B is ~a" (or a b))
; terminate printing
(terpri)
; set a as nil
(setq a nil)
; set b as 5
(setq b 5)
; perform or operation on a and b
(format t "~% A or B is ~a" (or a b))
; terminate printing
(terpri)
; set a as nil
(setq a nil)
; set b as 0
(setq b 0)
; perform or operation on a and b
(format t "~% A or B is ~a" (or a b))
; terminate printing
(terpri)
; set values of variables
(setq a 10)
(setq b 0)
(setq c 30)
(setq d 40)
; perform or operation on variables
(format t "~% Result of and operation on 10, 0, 30, 40 is ~a" (or a b c d))
; terminate printing
(terpri)
; set values of variables
(setq a 10)
(setq b 20)
(setq c nil)
(setq d 40)
; perform or operation on variables
(format t "~% Result of and operation on 10, 20, nil, 40 is ~a" (or a b c d))
; set a as 10
(setq a 10)
; perform not operation on a
(format t "~% not A is ~a" (not a))
; terminate printing
(terpri)
; set q as nil
(setq a nil)
; perform not operation on a
(format t "~% not A is ~a" (not a))
; terminate printing
(terpri)
; set q as 0
(setq a 0)
; perform not operation on a
(format t "~% not A is ~a" (not a))
; set a as 10
(setq a 10)
; set b as 20
(setq b 20)
; print equality of a and b
(format t "~% A = B is ~a" (= a b))
; print non-equality of a and b
(format t "~% A /= B is ~a" (/= a b))
; set a as 10
(setq a 10)
; set b as 20
(setq b 20)
; compare a with b for size and print result
(format t "~% A > B is ~a" (> a b))
(format t "~% A < B is ~a" (< a b))
(format t "~% A >= B is ~a" (>= a b))
(format t "~% A <= B is ~a" (<= a b))
; set a as 10
(setq a 10)
; set b as 20
(setq b 20)
; compute max of a and b and print the result
(format t "~% Max of A and B is ~d" (max a b))
; compute min of a and b and print the result
(format t "~% Min of A and B is ~d" (min a b))
; set a as 10
(setq a 10)
; set b as 20
(setq b 20)
; perform sum
(format t "~% A + B = ~d" (+ a b))
; perform substraction
(format t "~% A - B = ~d" (- a b))
; perform product
(format t "~% A x B = ~d" (* a b))
; perform multiplication
(format t "~% B / A = ~d" (/ b a))
; set a as 10
(setq a 10)
; increment a by 3
(format t "~% Increment A by 3 = ~d" (incf a 3))
; decrement a by 4
(format t "~% Decrement A by 4 = ~d" (decf a 4))
; set a as 10
(setq a 10)
; Modulus of a by 3
(format t "~% Mod A by 3 = ~d" (mod a 3))
; Remainder of a by 3
(format t "~% Rem A by 3 = ~d" (rem a 3))
(defun demo-function (flag)
   (print 'entering-outer-block)

   (block outer-block
      (print 'entering-inner-block)
      (print (block inner-block

         (if flag
            (return-from outer-block 3)
            (return-from inner-block 5)
         )

         (print 'This-wil--not-be-printed))
      )

      (print 'left-inner-block)
      (print 'leaving-outer-block)
   t)
)
(demo-function t)
(terpri)
(demo-function nil)
(setq a 10)
(loop
   (setq a (+ a 1))
   (write a)
   (terpri)
   (when (> a 17) (return a)
     )
)
(setq a 20)
(loop
   (setq a (- a 1))
   (write a)
   (terpri)
   (when (< a 10) (return a))
)
; loop on strings and print each value
(loop for x in '(tom dick harry)
   do (format t " ~s" x)
)
; loop on each number and print
(loop for a from 10 to 20
   do (print a)
)
; loop numbers from 1 to 20
(loop for x from 1 to 20
   ; if number is even
   if(evenp x)
   do (print x)
)
; perform a do loop
(do ((x 0 (+ 2 x)) ; initialize x to 0 and increment by 2
   (y 20 ( - y 2))) ; initialize y to 20 and decrement by 2
   ((= x y))  ; checking if x and y is same
   ; print values
   (format t "~% x = ~d  y = ~d" x y)
)
; perform a do loop
(do ((x 0 (+ 2 x)) ; initialize x to 0 and increment by 2
   (y 20 ( - y 2))) ; initialize y to 20 and decrement by 2
   ((> x y))  ; checking if x is greater than y
   ; print values
   (format t "~% x = ~d  y = ~d" x y)
)
; perform a do loop
(do ((x 0 (+ 2 x)) ; initialize x to 0 and increment by 2
   (y 20 ( - y 2))) ; initialize y to 20 and decrement by 2
   ((< y x))  ; checking if y is less than y
   ; print values
   (format t "~% x = ~d  y = ~d" x y)
)
; perform a dotimes operation on list of numbers
(dotimes (n 11)
   (print n) (prin1 (* n n)) ; print n and square of n
)
; perform a dotimes operation on list of numbers
(dotimes (n 11)
   (print n) (prin1 (* n(* n n))) ; print n and qube of n
)
; perform a dotimes operation on list of numbers
(dotimes (n 11)
   (print n) (prin1 (+ n n)); print n and double of n
)
; perform a dolist operation on list of numbers
(dolist (n '(1 2 3 4 5))
   (print n) ; print the number
)
; perform a dolist operation on list of numbers
(dolist (n '(1 2 3 4 5))
   (print n) (prin1 (* n(* n n))) ; print the qube of number
)
; perform a dolist operation on list of numbers
(dolist (n '(1 2 3 4 5))
   (print n) (prin1 (+ n n)) ; print double of number
)
; define a function to get average of four numbers
(defun averagenum (n1 n2 n3 n4)
   (/ ( + n1 n2 n3 n4) 4)
)
; call the function and print the result
(write(averagenum 10 20 30 40))
; define a function to caculate area of circle
(defun area-circle(rad)
   ;Calculates area of a circle with given radius
   ; terminate printing
   (terpri)
   ; print the radius
   (format t "Radius: ~5f" rad)
   ; print the area
   (format t "~%Area: ~10f" (* 3.141592 rad rad))
)
(area-circle 10)
(defun show-members (a b &optional c d) (write (list a b c d)))
(show-members 1 2 3)
(terpri)
(show-members 'a 'b 'c 'd)
(terpri)
(show-members 'a 'b)
(terpri)
(show-members 1 2 3 4)
(defun sum (a b &optional c)
   (if(not c)
      (write (+ a b))
      (write (+ a b c))
   ))
(terpri)
(sum 1 2)
(terpri)
(sum 1 2 3)
(defun product (a b &optional c)
   (if(not c)
      (write (* a b))
      (write (* a b c))
   ))
(terpri)
(product 1 2)
(terpri)
(product 1 2 3)
(defun show-members (a b &rest values) (write (list a b values)))
(show-members 1 2 3)
(terpri)
(show-members 'a 'b 'c 'd)
(terpri)
(show-members 'a 'b)
(terpri)
(show-members 1 2 3 4)
(terpri)
(show-members 1 2 3 4 5 6 7 8 9)
(defun show-members (&key a b c d ) (write (list a b c d)))
(show-members :a 1 :c 2 :d 3)
(terpri)
(show-members :a 'p :b 'q :c 'r :d 's)
(terpri)
(show-members :a 'p :d 'q)
(terpri)
(show-members :a 1 :b 2)
(defun add-all(a b c d)
   (+ a b c d)
)
(setq sum (add-all 10 20 30 40))
(write sum)
(terpri)
(write (add-all 23.4 56.7 34.9 10.0))
(defun myfunc (num)
   (return-from myfunc 10)
   num
)
(write (myfunc 20))
(defun myfunc (num)
   (return-from myfunc 10)
   write num
)
(write (myfunc 20))
(write ((lambda (a b c x)
   (+ (* a (* x x)) (* b x) c))
   4 2 9 3)
)
(write (mapcar '1+  '(23 34 45 56 67 78 89)))
(defun cubeMylist(lst)
   (mapcar #'(lambda(x) (* x x x)) lst)
)
(write (cubeMylist '(2 3 4 5 6 7 8 9)))
(write (mapcar '+ '(1 3 5 7 9 11 13) '( 2 4 6 8)))
(write (atom 'abcd))
(terpri)
(write (equal 'a 'b))
(terpri)
(write (evenp 10))
(terpri)
(write (evenp 7 ))
(terpri)
(write (oddp 7 ))
(terpri)
(write (zerop 0.0000000001))
(terpri)
(write (eq 3 3.0 ))
(terpri)
(write (equal 3 3.0 ))
(terpri)
(write (null nil ))
(defun factorial (num)
   (cond ((zerop num) 1)
      (t ( * num (factorial (- num 1))))
   )
)
(setq n 6)
(format t "~% Factorial ~d is: ~d" n (factorial n))
(write (/ 1 2))
(terpri)
(write ( + (/ 1 2) (/ 3 4)))
(terpri)
;(write (+ #c(1 2)#c(3 -4)))
(write (/ 45 78))
(terpri)
(write (floor 45 78))
(terpri)
(write (/ 3456 75))
(terpri)
(write (floor 3456 75))
(terpri)
(write (ceiling 3456 75))
(terpri)
(write (truncate 3456 75))
(terpri)
(write (round 3456 75))
(terpri)
(write (ffloor 3456 75))
(terpri)
(write (fceiling 3456 75))
(terpri)
(write (ftruncate 3456 75))
(terpri)
(write (fround 3456 75))
(terpri)
(write (mod 3456 75))
(terpri)
(setq c (complex 6 7))
(write c)
(terpri)
(write (complex 5 -9))
(terpri)
(write (realpart c))
(terpri)
(write (imagpart c))
(write 'a)
(terpri)
(write #\a)
(terpri)
(write-char #\a)
; case-sensitive comparison
(write (char= #\a #\b))
(terpri)
(write (char= #\a #\a))
(terpri)
(write (char= #\a #\A))
(terpri)
;case-insensitive comparision
(write (char-equal #\a #\A))
(terpri)
(write (char-equal #\a #\b))
(terpri)
(write (char-lessp #\a #\b #\c))
(terpri)
(write (char-greaterp #\a #\b #\c))
(write (setf my-array (make-array '(10))))
(terpri)
(setf (aref my-array 0) 25)
(setf (aref my-array 1) 23)
(setf (aref my-array 2) 45)
(setf (aref my-array 3) 10)
(setf (aref my-array 4) 20)
(setf (aref my-array 5) 17)
(setf (aref my-array 6) 25)
(setf (aref my-array 7) 19)
(setf (aref my-array 8) 67)
(setf (aref my-array 9) 30)
(write my-array)
(setf x (make-array '(3 3)
   :initial-contents '((0 1 2 ) (3 4 5) (6 7 8)))
)
(write x)
(setq a (make-array '(4 3)))
(dotimes (i 4)
   (dotimes (j 3)
      (setf (aref a i j) (list i 'x j '= (* i j)))
   )
)
(dotimes (i 4)
   (dotimes (j 3)
      (print (aref a i j))
   )
)
(setq myarray (make-array '(3 2 3)
   :initial-contents
   '(((a b c) (1 2 3))
      ((d e f) (4 5 6))
      ((g h i) (7 8 9))
   ))
)
(setq array2 (make-array 4 :displaced-to myarray :displaced-index-offset 2))
(write myarray)
(terpri)
(write array2)
(setq myarray (make-array '(3 2 3)
   :initial-contents
   '(((a b c) (1 2 3))
      ((d e f) (4 5 6))
      ((g h i) (7 8 9))
   ))
)
(setq array2 (make-array '(3 2) :displaced-to myarray :displaced-index-offset 2))
(write myarray)
(terpri)
(write array2)
(setq myarray (make-array '(3 2 3)
   :initial-contents
   '(((a b c) (1 2 3))
      ((d e f) (4 5 6))
      ((g h i) (7 8 9))
   ))
)
(setq array2 (make-array '(3 2) :displaced-to myarray :displaced-index-offset 5))
(write myarray)
(terpri)
(write array2)
;a one dimensional array with 5 elements,
;initail value 5
(write (make-array 5 :initial-element 5))
(terpri)

;two dimensional array, with initial element a
(write (make-array '(2 3) :initial-element 'a))
(terpri)

;an array of capacity 14, but fill pointer 5, is 5
(write(length (make-array 14 :fill-pointer 5)))
(terpri)

;however its length is 14
(write (array-dimensions (make-array 14 :fill-pointer 5)))
(terpri)

; a bit array with all initial elements set to 1
(write(make-array 10 :element-type 'bit :initial-element 1))
(terpri)

; a character array with all initial elements set to a
; is a string actually
(write(make-array 10 :element-type 'character :initial-element #\a))
(terpri)

; a two dimensional array with initial values a
(setq myarray (make-array '(2 2) :initial-element 'a :adjustable t))
(write myarray)
(terpri)

;readjusting the array
(adjust-array myarray '(1 3) :initial-element 'b)
(write myarray)
(write-line "Hello World")
(write-line "Welcome to Tutorials Point")

;escaping the double quote character
(write-line "Welcome to \"Tutorials Point\"")
; case-sensitive comparison
(write (string= "this is test" "This is test"))
(terpri)
(write (string> "this is test" "This is test"))
(terpri)
(write (string< "this is test" "This is test"))
(terpri)

;case-insensitive comparision
(write (string-equal "this is test" "This is test"))
(terpri)
(write (string-greaterp "this is test" "This is test"))
(terpri)
(write (string-lessp "this is test" "This is test"))
(terpri)

;checking non-equal
(write (string/= "this is test" "this is Test"))
(terpri)
(write (string-not-equal "this is test" "This is test"))
(terpri)
(write (string/= "lisp" "lisping"))
(terpri)
(write (string/= "decent" "decency"))
(write-line (string-upcase "a big hello from tutorials point"))
(write-line (string-capitalize "a big hello from tutorials point"))
(write-line (string-trim " " "   a big hello from tutorials point   "))
(write-line (string-left-trim " " "   a big hello from tutorials point   "))
(write-line (string-right-trim " " "   a big hello from tutorials point   "))
(write-line (string-trim " a" "   a big hello from tutorials point   "))
(write (length "Hello World"))
(terpri)
(write-line (subseq "Hello World" 6))
(write (char "Hello World" 6))
;sorting the strings
(write (sort (vector "Amal" "Akbar" "Anthony") #'string<))
(terpri)
;merging the strings
(write (merge 'vector (vector "Rishi" "Zara" "Priyanka")
   (vector "Anju" "Anuj" "Avni") #'string<))
(write-line (reverse "Are we not drawn onward, we few, drawn onward to new era"))
(write-line (concatenate 'string "Are we not drawn onward, " "we few, drawn onward to new era"))
(write (make-sequence '(vector float)
   10
   :initial-element 1.0))
(setq x (vector 'a 'b 'c 'd 'e))
(write (length x))
(terpri)
(write (elt x 3))
(write (count 7 '(1 5 6 7 8 9 2 7 3 4 5)))
(terpri)
(write (remove 5 '(1 5 6 7 8 9 2 7 3 4 5)))
(terpri)
(write (delete 5 '(1 5 6 7 8 9 2 7 3 4 5)))
(terpri)
(write (substitute 10 7 '(1 5 6 7 8 9 2 7 3 4 5)))
(terpri)
(write (find 7 '(1 5 6 7 8 9 2 7 3 4 5)))
(terpri)
(write (position 5 '(1 5 6 7 8 9 2 7 3 4 5)))
(write (delete-if #'oddp '(1 5 6 7 8 9 2 7 3 4 5)))
(terpri)
(write (delete-if #'evenp '(1 5 6 7 8 9 2 7 3 4 5)))
(terpri)
(write (remove-if #'evenp '(1 5 6 7 8 9 2 7 3 4 5) :count 1 :from-end t))
(terpri)
(setq x (vector 'a 'b 'c 'd 'e 'f 'g))
(fill x 'p :start 1 :end 4)
(write x)
(write (sort '(2 4 7 3 9 1 5 4 6 3 8) #'<))
(terpri)
(write (sort '(2 4 7 3 9 1 5 4 6 3 8) #'>))
(terpri)
(write (merge 'vector #(1 3 5) #(2 4 6) #'<))
(terpri)
(write (merge 'list #(1 3 5) #(2 4 6) #'<))
(terpri)
(write (every #'evenp #(2 4 6 8 10)))
(terpri)
(write (some #'evenp #(2 4 6 8 10 13 14)))
(terpri)
(write (every #'evenp #(2 4 6 8 10 13 14)))
(terpri)
(write (notany #'evenp #(2 4 6 8 10)))
(terpri)
(write (notevery #'evenp #(2 4 6 8 10 13 14)))
(terpri)
(write (map 'vector #'* #(2 3 4 5) #(3 5 4 8)))
(write ( + 15.0 (read)))
(write-line (concatenate 'string "hello " (read-preserving-whitespace)))
(listen ((read-char)))
(parse-integer (unread-char))
(peek-char (read-char-no-hang clear-input))
(with-input-from-string)
(write "Hello, world!")
(write 'foo)
(print "Hello, world!")
(prin1 "Hello, world!")
(princ "Hello, world!")
(format t "Hello, ~a!" "world")
(write-char #\A)
(write-string "Hello, world!")
(fresh-line)
(finish-output)
(write-to-string "Hello, world!")
(prin1-to-string "Hello, world!")
(princ-to-string "Hello, world!")
(defstruct book
   title
   author
   subject
   book-id
)
(setq v (make-vector 5 :initial-element 0))
(aref v 2)
(setf (aref v 2) 10)
(vectorp v)
(length v)
(vector-pop v)

; symbols :
; create object books, assign symbol title a value
(setf (get 'books 'title) '(Gone with the Wind))
; create object books, assign symbol author a value
(setf (get 'books 'author) '(Margaret Micheal))
; create object books, assign symbol publisher a value
(setf (get 'books 'publisher) '(Warner Books))
; retrieve title from books object
(write (get 'books 'title))
; terminate printing
(terpri)
; retrieve author from books object
(write (get 'books 'author))
; terminate printing
(terpri)
; retrieve publisher from books object
(write (get 'books 'publisher))
; define a function to create a tree
(defun make-tree (item)
   "it creates a new node with item."
   (cons (cons item nil) nil)
)
; create a function first child of a tree
(defun first-child (tree)
   (if (null tree)
      nil
      (cdr (car tree))
   )
)
; define a function to get sibling of a tree node
(defun next-sibling (tree)
   (cdr tree)
)
; define a function to get details from a tree node
(defun data (tree)
   (car (car tree))
)
; define a function to add a child to a tree node
(defun add-child (tree child)
   (setf (car tree) (append (car tree) child))
   tree
)

; create and set a list to lst
(setq lst (list '(1 2) '(3 4) '(5 6)))
; copy and set a list to mylst
(setq mylst (copy-list lst))
; copy tree and set to tr
(setq tr (copy-tree lst))
; print the first list
(write lst)
; terminate printing
(terpri)
; print the second list
(write mylst)
; terminate printing
(terpri)
; print tree
(write tr)

; create a hashtable
(setq empList (make-hash-table))
(setf (gethash '01 empList) '(Charlie Brown))
(setf (gethash '01 empList) '(Freddie Seal))
; print the value for 001 from hashtable
(write (gethash '01 empList))
; terminate printing
(terpri)
; print the value for 002 from hashtable
(write (gethash '02 empList))

; create a hashtable
(setq empList (make-hash-table))
(setf (gethash '001 empList) '(Charlie Brown))
(setf (gethash '002 empList) '(Freddie Seal))
(setf (gethash '003 empList) '(Mark Mongoose))

; print the hash for 001 from hashtable
(write (gethash '001 empList))
; terminate printing
(terpri)
; print the hash for 002 from hashtable
(write (gethash '002 empList))
; terminate printing
(terpri)
; print the hash for 003 from hashtable
(write (gethash '003 empList))
; remove hash value
(remhash '003 empList)
; terminate printing
(terpri)
; print the hash for 001 from hashtable
(write (gethash '003 empList))
; create a hashtable
(setq empList (make-hash-table))
(setf (gethash '001 empList) '(Charlie Brown))
(setf (gethash '002 empList) '(Freddie Seal))
(setf (gethash '003 empList) '(Mark Mongoose))

; map hash on hashtable
(maphash #'(lambda (k v) (format t "~a => ~a~%" k v)) empList)