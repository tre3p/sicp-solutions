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

(define (make-joint orig-account orig-account-password joint-acc-password)
	(lambda (passwd arg)
		(if (eq? passwd joint-acc-password)
			(orig-account orig-account-password arg)
			"Incorrect password")))

; Tests
(define peter-acc (make-account 100 'secret-password))

(define paul-acc
    (make-joint peter-acc 'secret-password 'rosebud))

(check-equal? ((peter-acc 'secret-password 'deposit) 10) 110)
(check-equal? ((paul-acc 'rosebud 'deposit) 10) 120)
(check-equal? ((peter-acc 'secret-password 'withdraw) 20) 100)
(check-equal? ((paul-acc 'rosebud 'withdraw) 85) 15)