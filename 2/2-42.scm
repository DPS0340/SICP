(define (queens board-size)
  (define (location x y)
    (list x y))
  (define (get-x loc)
    (car loc))
  (define (get-y loc)
    (car (cdr loc)))
  (define empty-board nil)
  (define (adjoin-position new-row k rest-of-queens)
    (cons (location new-row k) rest-of-queens))
  (define (safe? k positions)
    (if (or (null? positions) (null? (car positions)) (null? (cdr positions)) (null? (car (cdr positions))))
        #t
        (let (
              (my (car positions))
              (opposite (car (cdr positions))))
        (if (or (= (get-x my) (get-x opposite)) (= (get-y my) (get-y opposite)) (= (/ (get-y my) (get-x my)) (/ (get-y opposite) (get-x opposite))))
            #f
            (safe? (- k 1) (cdr positions))))))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 2) ; {{{1 2} {2 1}}}
; it works
