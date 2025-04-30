

(defun check-string (str)
  "Check if the string starts with 'a' and has a length greater than 5."
  (and (string= (subseq str 0 1) "a")
       (> (length str) 5)))

(defun process-strings ()
  (let ((string-array '("apple" "apricot" "avocado" "banana" "cherry")))
    (dolist (str string-array)
      (when (check-string str)
        (format t "String matching criteria: ~A~%" str)))))

(process-strings)



(defun process-strings2 ()
  "Process a list of strings and print those starting with 'a'."
  (let ((string-array '("apple" "banana" "avocado" "cherry" "apricot")))
    (dolist (str string-array)
      (when (funcall (lambda (s) (string= (subseq s 0 1) "a")) str)
        (format t "String starts with 'a': ~A~%" str)))))
(process-strings2)


(defun process-strings4 ()
  (let ((string-array '("apple\\napple" "apricot\\\"apricot" "avocado\\\\" "banana\\t" "cherry\\\"")))
    (dolist (str string-array)
        (format t "String matching criteria: ~A~%" str))))

(process-strings4)




(write ((lambda (a b c x)
   (* a b c x))
   4 2 9 3)
)





