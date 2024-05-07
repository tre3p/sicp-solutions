#lang sicp

(#%require rackunit)

(define (cycle? list)
	(define (cycle-iter elems seen)
		(display elems)
		(display " ")
		(display seen)
		(newline)
		(cond
			((null? elems) #f)
			((memq elems seen) #t)
			(else
				(cycle-iter (cdr elems) (cons elems seen)))))
	(cycle-iter list '()))

; Tests
(define lE '())
(define l0 '(1 2 3))
(define l1 (cons l0 l0))
(define l2 '(1 2 3))
(set-cdr! (cddr l2) l2)

(define l3 '(1 2 3))
(set-cdr! (cddr l3) (cdr l3))

(define l4 '(1 2 3 4))
(set-car! (cddr l4) (cdr l4))

(check-false (cycle? lE))
(check-false (cycle? l0))
(check-false (cycle? l1))
(check-false (cycle? l4))
(check-true (cycle? l2))
(check-true (cycle? l3))