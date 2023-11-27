#lang racket

(define (cont-frac n d k) ;* recursive
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
        (iter 1))

(define (d i)
  (- (* 2 i) 1))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- 0 (* x x))))
        (cont-frac n d k))

(tan-cf (/ pi 4) 100) ; 1.0