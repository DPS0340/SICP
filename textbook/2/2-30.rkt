#lang sicp
(define (map proc items)
       (if (null? items)
           nil
           (cons (proc (car items))
                 (map proc (cdr items)))))

(define (square x) (* x x))

(define (square-tree-recursive tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-recursive (car tree))
                    (square-tree-recursive (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree))
