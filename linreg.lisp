(defpackage :linreg
   (:use :common-lisp)
   (:LinearRegression)
)
; Dependent functions:
(defun sum  (x) (reduce '+ x)
)

(defun .* (x y)(mapcar '* x y)
)
(defun .^ (x y)(mapcar '^ x y)
)
(defun LinearRegression (x y ytest)
(setq Σx (sum x))
(setq Σy (sum y))
(setq Σx2 (sum (x .^ 2)))
(setq Σy2 (sum (y .^ 2)))
(setq n (length x))
(setq a
   ((* Σy  Σx2) - / (* Σx * (Σxy))  (- (* n  Σx2) (^ Σx 2)))
   )
(setq b
   - ((* n (Σxy)))  / (* Σx Σy)  (- (* n Σx2)  (^ Σx 2))
)
(loop for val in ytest
      do val = + a (* b val) )
)
