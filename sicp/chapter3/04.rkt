#lang sicp

(#%require rackunit)

(define (make-account balance password)
	(let ((incorrect-attempts 0)
		  (max-attempts 7))
		(define (withdraw amount)
			(if (>= balance amount)
				(begin (set! balance (- balance amount))
					balance)
				"Not enough funds!"))

		(define (deposit amount)
			(set! balance (+ balance amount))
				balance)

		(define (call-the-cops) "yo man you have problems now")

	    (define (dispatch user-passwd op)
	      (if (eq? user-passwd password)
	          (begin
	          	(set! incorrect-attempts 0)
	          	(cond ((eq? op 'withdraw) withdraw)
	                  ((eq? op 'deposit) deposit)
	                  (else "Unknown call")))
	          (begin
	            (set! incorrect-attempts (+ incorrect-attempts 1))
	            (if (>= incorrect-attempts max-attempts)
	                (call-the-cops)
	                "Incorrect password"))))
	dispatch))

(define incorrect-message "Incorrect password")
(define problems-message "yo man you have problems now")

(define acc (make-account 100 'secret-password))

(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? ((acc 'secret-password 'withdraw) 50) 50) ; Pass correct password to test counter reset logic
(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? (acc 'super-secret-password 'withdraw) incorrect-message)
(check-equal? (acc 'super-secret-password 'withdraw) problems-message)