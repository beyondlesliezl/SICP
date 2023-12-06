#lang racket

(define (equal? ls1 ls2)
  (cond 
    ((and (null? ls1) (null? ls2)) #t)
    ((or (null? ls1) (null? ls2)) #f)
    ((pair? (car ls1)) (equal? (car ls1) (car ls2)))
    (else (and (eq? (car ls1) (car ls2))
               (equal? (cdr ls1) (cdr ls2))))))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '(this is a list) '(this))
