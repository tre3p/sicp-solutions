#lang sicp

(#%require rackunit)

(define (count-pairs pairs)
	(define seen '())
	(define (count-pairs-iter el)
		(if (or (not (pair? el)) (memq el seen))
			0
			(begin
				(set! seen (cons el seen))
				(+
					(count-pairs-iter (car el))
					(count-pairs-iter (cdr el))
					1))))
	(count-pairs-iter pairs))

; Tests
(define nil '())
(define p1 (cons 'a nil))
(define p2 (cons p1 nil))
(define p3 (cons p1 p2))
(define p4 (cons p2 p1))
(define p5 (cons p1 p1))
(define p6 (cons p5 p5))

(check-equal? (count-pairs p3) 3)
(check-equal? (count-pairs p4) 3)
(check-equal? (count-pairs p6) 3)
(check-equal? (count-pairs '()) 0)