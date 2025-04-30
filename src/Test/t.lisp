(defun process-strings4 ()
  (let ((string-array '("apple\\napple" "apricot\\\"apricot" "avocado\\\\" "banana\\t" "cherry\\\"")))
    (dolist (str string-array)
        (format t "String matching criteria: ~A~%" str))))

(process-strings4)




(write ((lambda (a b c x)
   (* a b c x))
   4 2 9 3)
)