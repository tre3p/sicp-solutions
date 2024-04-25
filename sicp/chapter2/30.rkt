#lang sicp

(#%require rackunit)

(define (square a) (* a a))

(define (square-tree tree)
	(cond ((null? tree) nil)
		  ((not (pair? tree)) (square tree))
		  (else (cons (square-tree (car tree))
		  			  (square-tree (cdr tree))))))

(define (square-tree-hof tree)
	(map (lambda (sub-tree)
			(if (pair? sub-tree)
				(square-tree-hof sub-tree)
				(square sub-tree)))
	tree))

; Tests
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(check-equal? (square-tree tree) 	 '(1 (4 (9 16) 25) (36 49)))
(check-equal? (square-tree-hof tree) '(1 (4 (9 16) 25) (36 49)))