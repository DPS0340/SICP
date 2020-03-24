#lang sicp

(define (map proc items)
       (if (null? items)
           nil
           (cons (proc (car items))
                 (map proc (cdr items)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
  (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 n)))

(define (filter f seq)
  (if (null? seq)
      nil
      (if (f (car seq))
          (cons (car seq) (filter f (cdr seq)))
          (filter f (cdr seq)))
      )
  )

(define (unique-triples n)
  (filter (lambda (x) (not (null? x)))
          (reduce (lambda (x) x)
                  (map (lambda (i)
                         (map (lambda (j)
                                (map (lambda (k)
                                       (list i j k))
                                     (enumerate-interval 1 (- j 1))))
                              (enumerate-interval 1 (- i 1))
                              )) (enumerate-interval 1 n))
                  2)))

(define (reduce proc seq ord)
  (define (reduce-iter res f seqq order)
    (if (null? seqq)
        res
        (if (and (pair? (car seqq)) (< order ord))
            (reduce-iter (append res (reduce-iter nil f (car seqq) (+ order 1))) f (cdr seqq) order)
            (append (list (f (car seqq))) (reduce-iter res f (cdr seqq) order)))))
  (reduce-iter nil proc seq 0))

(define (unique-triples-equal-sum n s)
  (filter (lambda (x) (= (+ (car x) (car (cdr x)) (car (cdr (cdr x)))) s)) (unique-triples n)))

(unique-triples-equal-sum 5 10)
