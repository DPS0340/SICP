#lang sicp
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))
(define (product-2 term a next b)
    (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
(define (quarter-pi n)
  (define (square n) (* n n))
  (define (next-two n) (+ n 2))
  (/ (* 2 (/ (product-2 square 4 next-two n) n)) (product-2 square 3 next-two n)))
(display (* 4 (quarter-pi 10)))
