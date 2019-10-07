(define (f-prime x)
  (cond ((= x 0) 0)
        ((= x 1) 1)
        ((= x 2) 2)
        (else (f-iter x 3 0 1 2))))

(define (f-iter x count a b c)
  (cond ((= x count) (+ (* 3 a) (* 2 b) c))
        (else (f-iter x (+ count 1) b c (+ (* 3 a) (* 2 b) c)))))
