#lang sicp
(define (last-pair list)
  (if (= (length list) 1)
      (car list)
      (last-pair (cdr list))))
(display (last-pair (list 1 2 3 34)))
