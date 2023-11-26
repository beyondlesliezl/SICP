#lang racket

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value term (next a) next b))))
  
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum term a next b)
  (define (combiner a b)
    (+ a b))
    (accumulate-recursive combiner 0 term a next b))

(define (product term a next b)
  (define (combiner a b)
    (* a b))
  (accumulate-iter combiner 1 term a next b))

(define (cube x) (* x x x ))
(define (increase x) (+ x 1))

(sum cube 1 increase 3) ; 1 8 27
(product cube 1 increase 3) ; 1 8 27
(* 1 8 27)

(product cube 1 increase 5) ; 1 8 27 64 125
(* 1 8 27 64 125)
