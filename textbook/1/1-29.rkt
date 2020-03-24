#lang sicp
(define (cube x)
  (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-iter f a b n k)
    (if (< n k)
        0
        (if (or (= k 0) (= k n))
            (+ (f (+ a (* k h))) (simpson-iter f a b n (+ k 1)))
            (if (= (remainder k 2) 0)
                (+ (* 2 (f (+ a (* k h)))) (simpson-iter f a b n (+ k 1)))
                (+ (* 4 (f (+ a (* k h)))) (simpson-iter f a b n (+ k 1)))
                ))))
  (* (/ h 3) (simpson-iter f a b n 0)))

(simpson cube 0 1 100)
