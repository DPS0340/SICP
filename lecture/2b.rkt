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
        (+ (* (numer x) (denom y)
            (* (numer y) (denom x))))
        (* (denum x) (denom y))))

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