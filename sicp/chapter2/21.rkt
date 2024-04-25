#lang sicp

(#%require rackunit)

(define (square-list items)
	(if (null? items)
		nil
		(cons (* (car items) (car items)) (square-list (cdr items)))))

(check-equal? (square-list '(2 4 8)) '(4 16 64))

(define (square-list-2 items)
	(map (lambda (x) (* x x)) items))

(check-equal? (square-list-2 '(2 4 8)) '(4 16 64))