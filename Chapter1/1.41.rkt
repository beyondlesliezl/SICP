#lang racket

(define (double g)
  (lambda (x)
    (g (g x))))
    
(define (inc x) (+ x 1))

((double inc) 3)

(((double (double double)) inc) 5) ;* 21