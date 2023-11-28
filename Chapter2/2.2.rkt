#lang racket

(define (make-segment point1 point2)
  (cons point1 point2))

(define (start-segment line)
  (car line))

(define (end-segment line)
  (cdr line))


(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment seg)
  (define (average a b)
    (/ (+ a b) 2.0))
  (define (midpoint a b)
    (make-point (average (x-point a) (x-point b))
                (average (y-point a) (y-point b))))
  (midpoint (start-segment seg) (end-segment seg)))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define seg0 (make-segment (make-point 10 10) (make-point 20 20)))
(define seg1 (make-segment (make-point 3 3) (make-point 4 4)))


(print-point (midpoint-segment seg0))
(print-point (midpoint-segment seg1))