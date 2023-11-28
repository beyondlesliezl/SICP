#lang racket

(define (fringe ls)
  (cond
    ((null? ls) `())
    ((pair? (car ls)) (append (fringe (car ls)) (fringe (cdr ls))))
    (else (append (list (car ls)) (fringe (cdr ls))))))


(define x (list (list 1 2) (list 3 4)))
(fringe x)

;* better solution
(define (fringe items)
  (cond ((null? items) null)
        ((not (pair? items)) (list items))
        (else (append (fringe (car items))
                      (fringe (cdr items))))))