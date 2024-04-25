#lang sicp

(#%require rackunit)

(define empty-list '())

(define (same-parity first . rest) 
  (define (same-parity-iter elements) 
    (cond ((null? elements) empty-list)
          ((equal? (even? first) (even? (car elements))) 
            (cons (car elements) (same-parity-iter (cdr elements))))
          (else (same-parity-iter (cdr elements))))) 
  (cons first (same-parity-iter rest)))

(check-equal? (same-parity 1 2 3 4 5 6 7) '(1 3 5 7))
(check-equal? (same-parity 2 3 4 5 6 7) '(2 4 6))
(check-equal? (same-parity 1) '(1))