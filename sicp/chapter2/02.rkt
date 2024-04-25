#lang sicp

(#%require rackunit)

; Point
(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

; Segment
(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
  (let ((start-point (start-segment segment))
        (end-point (end-segment segment)))
    (let ((midpoint-x (/ (+ (x-point start-point) (x-point end-point)) 2))
          (midpoint-y (/ (+ (y-point start-point) (y-point end-point)) 2)))
      (make-point midpoint-x midpoint-y))))

; Tests

(define p1 (make-point 2 3))
(define p2 (make-point 4 5))

(define s (make-segment p1 p2))

(check-equal? (make-segment p1 p2) '((2 . 3) 4 . 5))
(check-equal? (midpoint-segment s) '(3 . 4))
(check-equal? (start-segment s) p1)
(check-equal? (end-segment s) p2)
(check-equal? (x-point p1) 2)
(check-equal? (y-point p2) 5)