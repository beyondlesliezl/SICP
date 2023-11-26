#lang racket

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) (result)))))
  (iter a 1))

(define (inc n) (+ n 1))
(define (identity x) x)

(define (pi-product-base product_f n)
  (define (term i)
    (if (even? i)
        (exact->inexact (/ (+ i 2) (+ i 1)))
        (exact->inexact (/ (+ i 1) (+ i 2)))))
  (product_f term 1 inc n))

(define (pi-product n)
  (pi-product-base product n))

(define (pi-product-2 n)
  (pi-product-base product-iter n))

(require rackunit)
(* 4 (pi-product 1000))