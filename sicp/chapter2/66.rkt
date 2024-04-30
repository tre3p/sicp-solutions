#lang sicp

(#%require rackunit)

(define (make-tree entry left right)
  (list entry left right))
(define (key entry) (car entry))
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (lookup search-key records-tree)
	(cond ((null? records-tree) false)
		  ((= (key (entry records-tree)) search-key) 
		  	(entry records-tree))
		  ((> (key (entry records-tree)) search-key)
		  	(lookup search-key (left-branch records-tree)))
		  (else (lookup search-key (right-branch records-tree)))))

; Tests
(define test-tree 
  (make-tree '(5 "Five") 
    (make-tree '(3 "Three") 
      (make-tree '(2 "Two") '() '())
      (make-tree '(4 "Four") '() '()))
    (make-tree '(8 "Eight") '() '())))


(check-equal? (lookup 5 test-tree) '(5 "Five"))
(check-equal? (lookup 2 test-tree) '(2 "Two"))
(check-equal? (lookup 6 test-tree) #f)
(check-equal? (lookup 8 test-tree) '(8 "Eight"))