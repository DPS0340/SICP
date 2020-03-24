#lang sicp
(define (equal? a b)
  (cond
    ((or (and (null? a) (not (null? b))) (and (null? b) (not (null? a)))) #f)
    ((or (and (pair? a) (not (pair? b))) (and (pair? b) (not (pair? a)))) #f)
    ((eq? a b) #t)
    ((and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))) #t)
    (else #f)))

(equal? `(this (is a) list) `(this (is a) list))
