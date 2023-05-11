#lang sicp

(define (A x y)
  (cond ((= y 0 ) 0)
        ((= x 0 ) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10); 2 ** 10
(A 2 4) ;2 ** 2 ** 2 ** 2
(A 3 3) ; (A 2 2**2) 

(define (f n) (A 0 n)) ; compute 2 * n
(f 10) ; expected 2 * n => 20

(define (g n) (A 1 n)) ; compute 2 ** n
(g 3) ;expected 2 ** 3 => 8

(define (h n) (A 2 n)) ; 
(h 3) ; expected 2 ** 2 ** 2 => 2 ** 4 => 2 * 2 * 2 * 2 => 16

(define (k n) ( * 5 n n))