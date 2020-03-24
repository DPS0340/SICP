#lang sicp
(define (A x y)
	(cond ((= y 0) 0)
	      ((= x 0) (* 2 y))
	      ((= y 1) 2)
	      (else (A (- x 1)
	               (A x (- y 1))))))

; 1024
(display (A 1 10))
(newline)
; 65536
(display (A 2 4))
(newline)
; 65536
(display (A 3 3))
(newline)
; 2n
(define (f n) (A 0 n))
; 2^n
(define (g n) (A 1 n))
; 2^2^n-1
(define (h n) (A 2 n))
; 5n^2
(define (k n) (* 5 n n))
