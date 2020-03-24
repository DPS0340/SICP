#lang sicp
(define (map proc items)
       (if (null? items)
           nil
           (cons (proc (car items))
                 (map proc (cdr items)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y)) 0 (map (lambda (x) (if (null? x)
                                                            0
                                                            (if (pair? x)
                                                                (count-leaves x)
                                                                1
                                                                ))) t)))

(count-leaves (list 1 2 3 (list 1 2) (list 1 (list 2 3))))
