(define (square x)
  (* x x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (search-for-primes a b)
  (define (search-for-primes-iter a b k)
    (if (< b k)
        (begin (newline)
        (display "end"))
        (if (= (remainder k 2) 1)
            (begin
              (timed-prime-test k)
              (search-for-primes-iter a b (+ k 2)))
            (begin
              (timed-prime-test k)
              (search-for-primes-iter a b (+ k 1))))))
  (search-for-primes-iter a b a))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))
