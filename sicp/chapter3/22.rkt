#lang sicp

(#%require rackunit)

(define (make-queue)
  (let ((head-ptr '())
        (tail-ptr '()))
    (define (empty-queue?) (null? head-ptr))
    (define (queue-head) (if (not (null? head-ptr)) (car head-ptr) '()))
    (define (queue-tail) (if (not (null? tail-ptr)) (car tail-ptr) '()))
    (define (set-head! val) (set! head-ptr val))
    (define (set-tail! val) (set! tail-ptr val))

    (define (insert-queue! item)
      (let ((new-tail (cons item '())))
        (if (empty-queue?)
            (begin
              (set-head! new-tail)
              (set-tail! new-tail))
            (begin
              (set-cdr! tail-ptr new-tail)
              (set-tail! new-tail)))
        head-ptr))

    (define (delete-queue!)
      (if (empty-queue?)
          (error "Queue is empty")
          (let ((result (queue-head)))
            (set-head! (cdr head-ptr))
            (if (empty-queue?)
                (set-tail! '()))
            result)))

    (define (print-queue)
    	(define (print-iter current)
    		(if (null? current)
    			(newline)
    			(begin
    				(display (car current))
    				(display " ")
    				(print-iter (cdr current)))))
    	(print-iter head-ptr))

    (define (dispatch op)
      (cond ((eq? op 'insert) insert-queue!)
            ((eq? op 'delete) delete-queue!)
            ((eq? op 'print) print-queue)
            (else (error "Unknown operation"))))
    dispatch))

;; Usage
(define q (make-queue))
((q 'insert) 'a)
((q 'insert) 'b)
(check-equal? ((q 'delete)) 'a)
((q 'insert) 'c)
(check-equal? ((q 'delete)) 'b)
(check-equal? ((q 'delete)) 'c)

((q 'insert) 'd)
(check-equal? ((q 'delete)) 'd)

((q 'insert) 'z)
((q 'insert) 'x)
((q 'insert) 'c)
(check-equal? ((q 'delete)) 'z)
(check-equal? ((q 'delete)) 'x)
(check-equal? ((q 'delete)) 'c)