#lang sicp
(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (even? n) (= (remainder n 2) 0))
(define (mult a b)
	(cond ((= b 0) 0)
	      ((even? b) (mult (double a) (halve b)))
	      (else (+ a (mult a (- b 1))))))
