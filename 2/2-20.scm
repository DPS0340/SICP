(define (same-parity . l)
  (define (same-parity-iter filter list result)
    (if (null? list)
        result
        (if (filter (car list))
            (same-parity-iter filter (cdr list) (cons result (car list)))
            (same-parity-iter filter (cdr list) result))))
  (if (= (remainder (car l) 2) 0)
      (same-parity-iter (lambda (x) (= (remainder x 2) 0)) l `())
      (same-parity-iter (lambda (x) (= (remainder x 2) 1)) l `())))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
      
