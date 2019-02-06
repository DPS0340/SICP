(define (cont-frac n d k)
  (if (< k 0)
      0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))
(display (+ (cont-frac (lambda (i) 1.0)
           (lambda (i) (cond ((= (remainder (+ i 1) 3) 0) (* 2 (/ (+ i 1) 3)))
                             (else 1.0)))
           10000) 2))
