(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(memq `apple `(pear banana prune))

(memq `apple `(x (apple sauce) y apple pear))

(list `a `b `c)

(list (list `george))

(cdr `((x1 x2) (y1 y2)))

(cadr `((x1 x2) (y1 y2)))

(pair? (car `(a short list)))

(memq `red `((red shoes) (blue socks)))

(memq `red `(red shoes blue socks))

; #f
; {apple pear}
; {a b c}
; {{george}}
; {{y1 y2}}
; {y1 y2}
; #f
; #f
; {red shoes blue socks}
