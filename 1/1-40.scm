(define (cube x) (* x x x))
(define (square x) (* x x))
(define (cubic a b c x)
  (+ (cube x) (* a (square x)) (* b x) c))
