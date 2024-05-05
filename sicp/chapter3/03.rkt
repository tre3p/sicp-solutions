#lang sicp

(#%require rackunit)

(define (make-account balance password)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount))
				balance)
			"Not enough funds!"))

	(define (deposit amount)
		(set! balance (+ balance amount))
			balance)

	(define (dispatch user-passwd op)
		(cond ((not (eq? user-passwd password)) "Incorrect password")
			  ((eq? op 'withdraw) withdraw)
			  ((eq? op 'deposit) deposit)
			  (else "Unknown call")))
	dispatch)

; Tests
(define incorrect-message "Incorrect password")
(define insufficient-message "Not enough funds!")

(define acc (make-account 100 'secret-password))

(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? ((acc 'secret-password 'withdraw) 50) 50)

(check-equal? (acc 'super-secret-password 'deposit) incorrect-message)
(check-equal? ((acc 'secret-password 'deposit) 50) 100)