(define (pascal i j)
  (cond ((or (= i j) (= j 1)) 1)
        (else (+ (pascal (- i 1) (- j 1)) (pascal (- i 1) j)))))
