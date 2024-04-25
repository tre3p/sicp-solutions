#lang sicp

(#%require rackunit)

(define (for-each fn items)
	(if (null? items)
		true
		(fn (car items)))
	(for-each fn (cdr items)))