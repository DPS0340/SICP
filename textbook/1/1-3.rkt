#lang sicp
(define (square a)
         (* a a))

(define (>= a b)
    (if (or (> a b) (= a b))
	       #t
	       #f)
  )

(define (core a b c)
	(cond ((or (and (>= a b) (>= b c)) (and (>= b a) (>= a c)))
	            (+ (square a) (square b)))
	       ((or (and (>= c b) (>= b a)) (and (>= b c) (>= c a)))
	            (+ (square c) (square b)))
	       ((or (and (>= a c) (>= c b)) (and (>= c a) (>= a b)))
	            (+ (square a) (square c)))
	)
)

(display (core 1 2 3))