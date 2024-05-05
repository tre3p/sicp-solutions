#lang sicp

(#%require rackunit)

(define (make-monitored fun)
	(let ((calls-count 0))
		(lambda (arg)
			(define (how-many-calls?) calls-count)

			(define (reset-count) (set! calls-count 0) 
				calls-count)

			(define (exec)
				(set! calls-count (+ calls-count 1))
				(fun arg))

			(define (dispatch m)
				(cond ((eq? m 'how-many-calls?) (how-many-calls?))
					  ((eq? m 'reset-count) (reset-count))
					  (else (exec))))

			(dispatch arg))))

; Tests
(define s (make-monitored sqrt))

(check-equal? (s 100) 10)
(check-equal? (s 25) 5)
(check-equal? (s 'how-many-calls?) 2)
(check-equal? (s 'reset-count) 0)
(check-equal? (s 100) 10)
(check-equal? (s 'how-many-calls?) 1)