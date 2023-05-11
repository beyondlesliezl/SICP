#lang sicp

(define (cube-iter guess x)
  (if (close-enough? guess (improve guess x))
      guess
      (cube-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) 0.0001))

(define (cube x)
  (cube-iter 1.0 x))

(cube 8) ; expect 2

(cube 27) ; expect 3

(cube 0.001) ;expected 0.1
