#lang sicp
(define (fringe x)
  (define (go remains result)
    (if (null? remains)
        result
        (if (pair? (car remains))
            (go (cdr remains) (cons result (fringe (car remains))))
            (go (cdr remains) (cons result (car remains))))))
  (go x `()))

(fringe (list (list (list 1 2) (list 3 4)) (list (list 1 2) (list 3 4))))
