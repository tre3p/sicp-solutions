#lang sicp

(#%require rackunit)

(define (square a) (* a a))
(define (sum-square a b) (+ (square a) (square b)))

(define (solution a b c)
	(cond 
		((and (> a b) (> b c)) (sum-square a b))
		((and (> a b) (> c b)) (sum-square a c))
		(else (sum-square c b))))

(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 4 2 3) 25)
(check-equal? (solution 0 0 0) 0)
(check-equal? (solution 1 0 1) 2)
(check-equal? (solution 2 3 2) 13)