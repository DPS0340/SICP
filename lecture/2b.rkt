#lang sicp

; Fraction System

; Formula Explained
; n1/d1 + n2/d2 = (n1*d2 + n2*d1)/(d1*d2)
; n1/d1 * n2/d2 = (n1*n2)/(d1*d2)

; imagine the clouds that include n and d
; that's wishful thinking

; (make-rat n d) -> make cloud
; (numer cloud) -> n
; (denom cloud) -> d

; below from here is george's business
; we don't care about it

; add of two rational number

(define (+rat x y)
    (make-rat 
        (+ (* (numer x) (denom y))
            (* (numer y) (denom x)))
        (* (denom x) (denom y))))

; multiply of two rational number
(define (*rat x y)
    (make-rat
        (* (numer x) (numer y))
        (* (denom x) (denom y))))

; (make-rat n d) <- constructor
; (numer cloud) <- selector
; (denom cloud) <- selector

; -----------
; (x+y)*(s+t)
; -----------
; (*rat (+rat x y) (+rat s t))


; (cons x y)
;   constructs a pair whose first part is
;   x and whose second part is y
;
; (car p)
;   selects the first part of the pair p
;
; (cdr p)
;   selects the second part of the pair p 

(cons 2 3)

; 
; box and pointer
;
;     |
;     V
;  --------- 
;  | 2 | 3 | 
;  ---------

; For any x and y
;
;   (car (cons x y)) is x
;   (cdr (cons x y)) is y


(define (make-rat n d)
    (cons n d))
;
; ---
;
(define (numer x) (car x))

(define (denom x) (cdr x))

(define a (make-rat 1 2))
(define b (make-rat 1 4))
(define ans (+rat a b))

(numer ans); -> 6
(denom ans); -> 8

(define (make-rat-fixed n d)
    (let ((g (gcd n d)))
        (cons (/ n g)
              (/ d g))))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
;
; for working example. not in lecture
;
(define _a (make-rat-fixed 2 4))
(numer _a)
(denom _a)

(define a 5)


(let ((z 10))
    (+ z z)); -> 20

; z; unbound variable
; let -> local variable