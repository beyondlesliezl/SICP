#lang racket

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.00001))
      (< (abs (- v1 v2)) tolerance)))
  (define (try guess step)
    (display "step ")
    (display step)
    (display ": guess = ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ step 1)))))
  (try first-guess 1))

(define tolerance 0.0001)

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(define (average a b) (/ (+ a b) 2))

;(fixed-point (lambda (x) (+ 1 (/ 1 x)))
             ;1.0)

(fixed-point (lambda (x) (/ (log 1000) (log x)))
             1.1)

(define (find-root-damp)
  (define (f x)
    (average x (/ (log 1000) (log x))))
  (fixed-point f 2))
(display "newtest: ")
(find-root-damp)