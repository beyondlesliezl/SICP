#lang racket

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i)) ; base case
        (/ (n i) (+ (d i) (iter (+ i 1))))))
        (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

(define (cont-frac-re n d k) ;* 自里向外迭代
  (define (iter i ret)
    (if (< i 1)
        ret
        (iter (- i 1)
              (/ (n i) (+ (d i) ret)))))
  (iter (- k 1) (/ (n k) (d k))))

(cont-frac-re (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

