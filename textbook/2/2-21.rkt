#lang sicp
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))
(define (square x) (* x x))
(define (square-list-a items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-a (cdr items)))))
(define (square-list-b items)
  (map square items))
(display (square-list-a (list 1 2 3 4)))
(newline)
(display (square-list-b (list 1 2 3 4)))
;(1 4 9 16)
;(1 4 9 16)
