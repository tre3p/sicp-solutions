#lang sicp

(#%require rackunit)

(define (reverse items)
  (define (reverse-iter l reversed)
    (if (null? l)
      reversed
      (iter (cdr l) (cons (car l) reversed))))

  (reverse-iter items '()))

(check-equal? (reverse '()) '())
(check-equal? (reverse (list 1)) (list 1))
(check-equal? (reverse (list 2 4 6 9)) (list 9 6 4 2))
(check-equal? (reverse (list 1 4 9 16 25)) '(25 16 9 4 1))