(define (deep-reverse list)
  (define empty `())
  (define (deep-reverse-iter result list1)
    (if (null? list1)
        result
        (if (pair? (car list1))
            (deep-reverse-iter (cons (deep-reverse (car list1)) result) (cdr list1))
            (deep-reverse-iter (cons (car list1) result) (cdr list1)))))
  (deep-reverse-iter empty list))

(deep-reverse (list (list 1 2) (list 3 4)))
