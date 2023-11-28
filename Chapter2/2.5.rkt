#lang racket

(define (my-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (my-car z)
  (define (iter z a)
    (if (= 0 (remainder z 2))
           (iter (/ z 2) (+ a 1))
                 a))
  (iter z 0))

(define (my-cdr z)
  (define (iter z b)
    (if (= 0 (remainder z 3))
           (iter (/ z 3) (+ b 1))
           b))
  (iter z 0))


(my-car (my-cons 10 20))
(my-cdr (my-cons 10 20))
  