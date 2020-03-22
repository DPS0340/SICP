(define (for-each f items)
  (if (= (length items) 1)
      (f (car items))
      ((f (car items)) (for-each f (cdr items)))))
(for-each (lambda (x) (newline) (display x)) (list 57 321 88))
;57
;321
;88 application: not a procedure;
; expected a procedure that can be applied to arguments
;  given: #<void>
;  arguments...:
;
; ...
