#lang racket

(define (smooth f)
  (lambda (x)
    (average (f (+ x dx)) (f x) (f (- x dx)))))

(define (average  a b c)
  (/ (+ a b c) 3))

(define dx 0.00001)

(define (repeated f n)
  (define (iter i res)
    (if (= i n)
        res 
        (iter (+ i 1) (lambda (x) (f (res x))))))
  (iter 1 f))


(define (smooth-n-times f n)
  ((repeated smooth n)  f))

(define (square x) (* x x))

((smooth square) 5)             ; 25.000000000066663
((smooth-n-times square 10) 5)  ; 25.000000000666663