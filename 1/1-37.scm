(define (cont-frac n d k)
  (define (cont-frac-iter count)
        (if (> count k)
            0
            (/ (n count) (+ (d count) (cont-frac-iter (+ count 1))))))
    (cont-frac-iter 1))
(display (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           50))
