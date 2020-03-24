#lang sicp
(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(width (add-interval (make-interval 0 10) (make-interval 0 6))) ; 8

(width (sub-interval (make-interval 0 10) (make-interval 0 6))) ; 8

(+ (width (make-interval 0 10)) (width (make-interval 0 6))) ; 8
; add or sub, result width = width x + width y

(width (mul-interval (make-interval 1 10) (make-interval 1 6))) ; 29+(1/2)

(width (div-interval (make-interval 1 10) (make-interval 1 6))) ; 4.916666666666667

(+ (width (make-interval 1 10)) (width (make-interval 1 6))) ; 8
