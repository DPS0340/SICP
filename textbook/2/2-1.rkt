#lang sicp
(define (abs x)
  (if (< x 0)
      (* x -1)
      x))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let
      ((g (gcd (abs n) (abs d))))
    (cond ((and (< n 0) (< d 0))(cons (/ (abs n) g) (/ (abs d) g)))
          ((and (< n 0) (>= d 0))(cons (/ n g) (/ d g)))
          ((and (>= n 0) (< d 0)) (cons (/ (* n -1) g) (/ (abs d) g)))
          (else (cons (/ n g) (/ d g))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -1 -5))
(print-rat (make-rat 1 -5))
(print-rat (make-rat -1 5))
(print-rat (make-rat 1 5))
