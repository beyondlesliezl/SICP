#lang sicp

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(define (f n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n 2)))

(define (f-iter a b c n counter)
  (cond
    ((= counter n) a)
    (else (f-iter (+ a (* 2 b) (* 3 c))
          a b n (+ counter 1)))) )

(f 10)
(f-recursive 10)
    
    