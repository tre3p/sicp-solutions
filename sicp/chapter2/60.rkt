#lang sicp

(#%require rackunit)

(define (element-of-set? x set)
	(cond ((null? set) false)
		  ((equal? (car set) x) true)
		  (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set) (cons x set))

(define (union-set set1 set2) (append set1 set2))

(define (intersection-set set1 set2)
	(cond ((or (null? set1) (null? set2)) '())
		  ((element-of-set? (car set1) set2)
		  	(cons (car set1)
		  		(intersection-set (cdr set1) set2)))
		  (else (intersection-set (cdr set1) set2))))

; Tests
(define first '(1 2 3 5 3))
(define second '(3 4 5 6 5))

(check-equal? (union-set first second) '(1 2 3 5 3 3 4 5 6 5))
(check-equal? (intersection-set first second) '(3 5 3))
(check-equal? (intersection-set second first) '(3 5 5))