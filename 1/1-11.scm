; recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* (f (- n 2)) 2) (* (f (- n 3)) 3))
      ))

;iterating
(define (g n)
  (define (go a b c k)
    (if (>= k n)
        c
        (go b c (+ c (* 2 b) (* 3 a)) (+ k 1))))
  (if (< n 3)
      n
      (go 0 1 2 2)
      ))

(f 7) ; 142
(g 7) ; 142
