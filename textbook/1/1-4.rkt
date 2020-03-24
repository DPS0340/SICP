#lang sicp
(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))

(display (a-plus-abs-b 3 15))
(newline)
(display (a-plus-abs-b 3 -15))