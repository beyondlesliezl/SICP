#lang racket

(define (cont-frac n d k) ;* recursive
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
        (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

(define (cont-frac-iter n d k)
  (define (iter i res)
    (if (= i 0)
        res
        (iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter k (/ (n k) (d k))))

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

