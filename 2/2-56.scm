(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list `* m1 m2))))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list `+ a1 a2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) `+)))

(define (augend s) (cadr s))

(define (addend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) `*)))

(define (multiplicand p) (cadr p))

(define (multiplier p) (caddr p))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) `**)))

(define (base x)
  (cadr x))

(define (exponent x)
  (caddr x))

(define (pow x y)
  (if (= y 0)
      1
      (* x (pow x (- y 1)))))

(define (make-exponentation a1 a2)
  (cond ((=number? a2 0) 1)
        ((=number? a1 1) a1)
        ((and (number? a1) (number? a2)) (pow a1 a2))
        (else (list `** a1 a2))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (if (= (exponent exp) 1)
             (base exp)
             (make-product (make-product (exponent exp)
                                         (make-exponentation (base exp) (- (exponent exp) 1)))
                           (deriv (base exp) var))))
        (else
         (error "unknown expression type -- DERIV" exp))))

(deriv `(** x 10) `x)

; {* 10 {** x 9}}

; and some practice

(define (value-set x k)
  (list x k))

(define (sym valset)
  (car valset))

(define (value valset)
  (car (cdr valset)))

(define (parse-tree f tree)
  (if (null? tree)
      nil
      (if (pair? (car tree))
          (cons (parse-tree f (car tree)) (parse-tree f (cdr tree)))
          (f (car tree)))))

(define (parse-tree-cond f filter tree)
  (define (go rest)
    (if (null? rest)
        nil
        (if (filter (car rest))
            (cons (f (car rest)) (parse-tree-cond f filter (cdr rest)))
            (cons (car rest) (parse-tree-cond f filter (cdr rest))))))
  (if (null? tree)
      nil
      (if (pair? (car tree))
          (cons (parse-tree-cond f filter (car tree)) (parse-tree-cond f filter (cdr tree)))
          (go tree))))

(define (eval-exp exp set)
  (if (null? set)
      exp
      (let ((first-set (car set)))
        (eval-exp (parse-tree-cond (lambda (x) (value first-set)) (lambda (x) (eq? (sym first-set) x)) exp) (cdr set)))))

(eval-exp `(+ x (* (* x x) (+ x y))) `((x 10) (y 15)))

; {+ 10 {* {* 10 10} {+ 10 15}}}
