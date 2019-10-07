(define (expt n k)
  (if (= k 0)
      1
      (* n (expt n (- k 1)))))

(define (cons-int a b)
  (* (expt 2 a) (expt 3 b)))

(define (car-int n)
  (define (car-iter curr k)
    (if (not (= (remainder curr 2) 0))
        k
        (car-iter (/ curr 2) (+ k 1))))
  (car-iter n 0))

(define (cdr-int n)
  (define (cdr-iter curr k)
    (if (not (= (remainder curr 3) 0))
        k
        (cdr-iter (/ curr 3) (+ k 1))))
  (cdr-iter n 0))

(car-int (cons-int 5 6)) ; 5
(cdr-int (cons-int 5 6)) ; 6
