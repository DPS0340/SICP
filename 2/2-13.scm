(define (make-interval a b) (cons a b))
(define (upper-bound x)
  (max (car x) (cdr x)))
(define (lower-bound x)
  (min (car x) (cdr x)))

(define (make-center-percent c p)
  (let ((delta (* (/ c 100) p)))
    (make-interval (- c delta) (+ c delta))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (percent pair)
  (* (/ (width pair) (center pair)) 100))

(percent (mul-interval (make-center-percent 100 0.1) (make-center-percent 100 0.3))) ; 0.3999988000035909

; approximately percent a + percent b
