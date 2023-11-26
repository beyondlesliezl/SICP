#lang sicp

(define (mul a b)
  (define (iter a b c)
    (cond
      ((= b 0)  c)
      ((even? b) (iter (double a) (halve b) c))
      (else (iter a (- b 1) (+ c a)))))
      (iter a b 0))

(define (even? x)
  (= (remainder x 2) 0))

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(mul 2 6)
(mul 39 11)
(* 39 11)
