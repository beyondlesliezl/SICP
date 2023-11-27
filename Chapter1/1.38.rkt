#lang racket

(define (d i)
  (define (f i)
    (if (= (remainder (- i 1) 3) 0)
        (* (/ (+ i 2) 3) 2)
    1))
      (cond
        ((= i 1) 1)
        (else (f (- i 1)))))
        
(define (n i)
  1)

(define (cont-frac n d k) ;* recursive
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
        (iter 1))

(exact->inexact (+ 2 (cont-frac n d 100)))