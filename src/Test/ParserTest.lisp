; create and print a list
(write (list 1 2))
; terminate printing
(terpri)
; create and print a list
(write (list 'a 'b))
; terminate printing
(terpri)
; create and print a list
(write (list 1 nil))
; terminate printing
(terpri)
; create and print a list
(write (list 1 2 3))
; terminate printing
(terpri)
; create and print a list
(write (list 'a 'b 'c))
; terminate printing
(terpri)
; create and print a list an car
(write (list 3 4 'a (car '(b . c)) (* 4 -2)))
; terminate printing
(terpri)
; create and print a list of lists
(write (list (list 'a 'b) (list 'c 'd 'e)))