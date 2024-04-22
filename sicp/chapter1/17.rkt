#lang sicp

(#%require rackunit)

(define (double a) (* a 2))
(define (halve a) (/ a 2))
(define (even? a) (= (remainder a 2) 0))

(define (fast-mul a b)
	(cond ((= b 0) 0)
		  ((even? b) (fast-mul (double a) (halve b)))
		  (else (+ a (fast-mul a (- b 1))))))

(check-equal? (fast-mul 2 3) 6)
(check-equal? (fast-mul 8 8) 64)
(check-equal? (fast-mul 3 7) 21)
(check-equal? (fast-mul 3 3) 9)