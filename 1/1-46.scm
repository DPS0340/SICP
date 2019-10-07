(define (iterative-improve compare improve init)
  (define (go guess)
    (define next (improve guess))
    (if (compare guess next)
        next
        (go next)))
  (go init))
