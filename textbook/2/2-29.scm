(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (define (check-mobile branch)
    (if (list? branch)
        (if (null? branch)
            0
            (total-weight (branch-structure branch)))
        branch))
  (if (list? mobile)
      (if (null? mobile)
          0
          (+ (check-mobile (left-branch mobile)) (check-mobile (right-branch mobile)))
          )
      mobile))

(define (total-torque branch)
  (define (calculate-torque branch)
    (if (list? branch)
        (if (null? branch)
            0
            (* (branch-length branch) (parse-mobile (branch-structure branch))))
        branch))
  (define (parse-mobile mobile)
    (if (list? mobile)
        (if (null? mobile)
            0
            (+ (calculate-torque (left-branch mobile)) (calculate-torque (right-branch mobile))))
        mobile))
  (calculate-torque branch))

(define (balanced? mobile)
  (define (balanced-go branch)
    (if (list? branch)
        (if (null? branch)
            #t
            (balanced? (branch-structure branch)))
        #t)
    )
  (if (list? mobile)
      (if (null? mobile)
          #t
          (and #t (and (= (total-torque (left-branch mobile)) (total-torque (right-branch mobile))) (balanced-go (left-branch mobile)) (balanced-go (right-branch mobile)))))
      #t))

(define mobile (make-mobile (make-branch 3 10) (make-branch 3 10)))

(total-weight mobile)

(total-torque (left-branch mobile))

(balanced? mobile)

; d

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))
