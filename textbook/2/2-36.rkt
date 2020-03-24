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

(define (accumulate-n op init seqs) ; use map
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x)
                                       (car x))
                                     seqs))
            (accumulate-n op init (map (lambda (x)
                                       (cdr x))
                                     seqs)))))

(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
