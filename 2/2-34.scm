(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (define (func a b)
                  (if (null? b)
                      a
                  (+ a (* b x))))
                (func this-coeff higher-terms))
              0
              coefficient-sequence))
