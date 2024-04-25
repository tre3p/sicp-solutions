#lang sicp

(#%require rackunit)

(define (deep-reverse items)
	(define (deep-reverse-iter elements reversed)
		(if (null? elements)
			reversed
			(deep-reverse-iter
				(cdr elements)
				(cons (if (pair? (car elements))
						(deep-reverse-iter (car elements) '())
						(car elements))
				reversed))))
	(deep-reverse-iter items '()))

(define x (list (list 1 2) (list 3 4)))
(define y '((1 2)(3 4)(5 6)))

(check-equal? (deep-reverse x) (list (list 4 3) (list 2 1)))
(check-equal? (deep-reverse y) '((6 5)(4 3)(2 1)))