#lang racket

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (cons (square (car things))
                                 answer))))
  (iter items `()))

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (cons answer 
                                 (square (car things))))))
  (iter items `()))

(define (square x) (* x x ))

(square-list-2 (list 1  2 3 4))
