#lang sicp

(#%require rackunit)

(define (element-of-set? x set)
	(cond ((null? set) nil)
		  ((= (car set) x) true)
		  ((> (car set) x) false)
		  (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
	(if (element-of-set? x set)
		set
		(cons x set)))

; Tests
(define x (adjoin-set 2 '()))
(define y (adjoin-set 0 x))
(define z (adjoin-set 1 y))
(define q (adjoin-set 1 z))

(check-equal? z q)
(check-equal? (adjoin-set 1 (adjoin-set 0 (adjoin-set 2 '())))
              (adjoin-set 1 (adjoin-set 2 (adjoin-set 0 '()))))