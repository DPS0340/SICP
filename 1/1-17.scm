(define (product-prime a b)
  (define (double a)
    (+ a a))
  (define (halve a)
    (/ a 2))
  (if (= b 0)
      0
      (if (= (remainder b 2) 0)
          (double (product-prime a (halve b)))
          (+ a (product-prime a (- b 1))))))


(product-prime 2 6)
