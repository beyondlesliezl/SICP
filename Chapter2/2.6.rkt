#lang racket

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f x))))
  
(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (my-plus n m)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))

(define (inc x) (+ x 1))

(((my-plus one two) inc) 0) ;; 输出 3