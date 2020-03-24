#lang sicp
(define (square x) (* x x))
(define (even? n) (= (remainder n 2) 0))
(define (fast-expt b n) (fast-expt-iter 1 b n))
(define (fast-expt-iter curr b n)
  (cond ((= n 0) curr)
        ((even? n) (fast-expt-iter curr (square b) (/ n 2)))
        (else (fast-expt-iter (* curr b) b (- n 1)))))

(display (fast-expt 3 2))
