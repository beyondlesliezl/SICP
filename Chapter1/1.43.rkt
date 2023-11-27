#lang racket

(define (repeated f n)
  (define (iter i res)
    (if (= i n)
        res 
        (iter (+ i 1) (lambda (x) (f (res x))))))
  (iter 1 f))

(define (repeated-recur f n)
  (define (iter i)
    (if (= i n)
        f
        (lambda (x) (f ((iter (+ i 1)) x)))))
  (iter 1))
    

((repeated (lambda (x) (* x x)) 2) 5)
((repeated-recur (lambda (x) (* x x)) 2) 5)