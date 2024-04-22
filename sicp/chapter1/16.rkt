#lang sicp

(#%require rackunit)

(define (square n) (* n n))
(define (even? n) (= (remainder n 2) 0))

(define (fast-expt-log b n)
	(define (fast-expt-log-iter b n a)
		(cond ((= n 0) a)
			  ((even? n) (fast-expt-log-iter (square b) (/ n 2) a))
			  (else (fast-expt-log-iter b (- n 1) (* a b)))))
	(fast-expt-log-iter b n 1))

(check-equal? (fast-expt-log 10 0) 1)
(check-equal? (fast-expt-log 3 20) (expt 3 20))
(check-equal? (fast-expt-log 2 10) (expt 2 10))
(check-equal? (fast-expt-log 0 5) 0)