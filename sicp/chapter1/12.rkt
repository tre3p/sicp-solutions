#lang sicp

(#%require rackunit)

(define (pascal-triangle row number)
	(if (or (= row number) (= number 1))
		1
		(+ (pascal-triangle (dec row) number) (pascal-triangle (dec row) (dec number)))))

(check-equal? (pascal-triangle 1 1) 1)
(check-equal? (pascal-triangle 3 2) 2)
(check-equal? (pascal-triangle 4 3) 3)
(check-equal? (pascal-triangle 5 2) 4)
(check-equal? (pascal-triangle 5 3) 6)