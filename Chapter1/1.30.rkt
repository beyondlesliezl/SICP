#lang racket

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(module* test #f
  (require rackunit)
  (define (inc n) (+ n 1))
  (define (identity x) x)
  
  (check-equal? (sum identity 1 inc 100) 5050)
)
         