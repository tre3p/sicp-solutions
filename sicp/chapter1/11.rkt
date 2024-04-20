#lang sicp

(#%require rackunit)

(define (f n)
	(if (< n 3)
		n
		(+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))


; on each step pass as current-res result of expression:
; (current-res + (current-iter * (n - current-iter)))
; where current-res is result of previous calculation (with initial value = 1)
(define (f-iter n)
	(define (iter current-iter current-res)
		(if (> current-iter 3)
			current-res
			(iter (inc current-iter) (+ current-res
									 (* current-iter (- n current-iter))))))
	(if (< n 3)
		n
		(iter 1 1)))

(check-equal? (f 4) 11)
(check-equal? (f-iter 4) 11)
(check-equal? (f 3) 4)
(check-equal? (f-iter 1) 1)