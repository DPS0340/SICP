#lang sicp
(define (append-elem elem list)
  (cons elem list))
(define (reverse list)
  (define empty `())
  (define (reverse-iter result list1)
    (if (null? list1)
        result
        (reverse-iter (append-elem (car list1) result) (cdr list1))))
  (reverse-iter empty list))
(display (reverse (list 1 2 3 4 5)))
;(5 4 3 2 1)
