#lang sicp

(#%require rackunit)

(define (make-queue) (cons '() '()))
(define (queue-head queue) (car queue))
(define (queue-tail queue) (cdr queue))
(define (set-head! queue item) (set-car! queue item))
(define (set-tail! queue item) (set-cdr! queue item))
(define (empty-queue? queue) (null? (car queue)))

(define (insert-queue! queue item)
	(let ((new-tail (cons item '())))
		(cond ((empty-queue? queue)
			(set-head! queue new-tail)
			(set-tail! queue new-tail)
			queue)
		(else
			(set-cdr! (queue-tail queue) new-tail)
			(set-tail! queue new-tail)
			queue))))

(define (delete-queue! queue)
	(cond ((empty-queue? queue)
		  (error "Queue is empty, so no delete possible"))
		(else
			(set-head! queue (cdr (queue-head queue)))
			queue)))

(define (print-queue queue)
	(define (print-iter queue-item)
		(cond ((null? queue-item) (newline))
			  (else
			  	(display (car queue-item))
			  	(display " ")
			  	(print-iter (cdr queue-item)))))
	(print-iter (queue-head queue)))

(define q (make-queue))

(insert-queue! q 'a)
(print-queue q)

(insert-queue! q 'b)
(print-queue q)

(delete-queue! q)
(print-queue q)

(insert-queue! q 'c)
(print-queue q)

(delete-queue! q)
(print-queue q)

(delete-queue! q)
(print-queue q)