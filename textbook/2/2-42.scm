(define (map proc items)
       (if (null? items)
           nil
           (cons (proc (car items))
                 (map proc (cdr items)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter f seq)
  (if (null? seq)
      nil
      (if (f (car seq))
          (cons (car seq) (filter f (cdr seq)))
          (filter f (cdr seq)))
      )
  )

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (queens board-size)
  (define (abs x)
    (if (< x 0)
        (* x -1)
        x))
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
    (define (safe-iter rest)
      (if (null? rest)
          #t
          (let (
                (my (car positions))
                (opposite (car rest)))
            (if (or (= (get-x my) (get-x opposite)) (= (get-y my) (get-y opposite)) (= (abs (- (get-y my) (get-y opposite))) (abs (- (get-x my) (get-x opposite)))))
                #f
                (safe-iter (cdr rest))))))
    (if (null? positions)
        #t
        (safe-iter (cdr positions))))
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

(queens 4) ; {{{3 4} {1 3} {4 2} {2 1}} {{2 4} {4 3} {1 2} {3 1}}}
; it works well(really)
