#lang sicp

(define (sum-max-two x y z)
  (cond
    ((and (> x y) (> z y))
     (+ x z))
    ((and (> y x) (> z x))
     (+ y z))
    (else
     (+ x y))))

(sum-max-two 1 2 3) ;expect 5
(sum-max-two 2 1 3) 
(sum-max-two 3 1 2)
(sum-max-two 3 2 1)