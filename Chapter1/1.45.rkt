#lang racket

(define (repeated f n)
  (define (iter i res)
    (if (= i n)
        res 
        (iter (+ i 1) (lambda (x) (f (res x))))))
  (iter 1 f))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.00001))
      (< (abs (- v1 v2)) tolerance)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b) (/ (+ a b) 2))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))

(define (nth-root x n)
  (define (fn y)
    (/ x (fast-expt y (- n 1))))
  (fixed-point ((repeated average-damp (- n 1)) fn) 1.0))


(module* test #f
  (require rackunit)
  (define (for-loop n last op)
    (cond ((<= n last)
           (op n)
           (for-loop (+ n 1) last op))))
  
  (define (check-n n)
    (check-= (nth-root n 2) (expt n (/ 1 2)) 0.0001)
    (check-= (nth-root n 3) (expt n (/ 1 3)) 0.0001)
    (check-= (nth-root n 4) (expt n (/ 1 4)) 0.0001)
    (check-= (nth-root n 5) (expt n (/ 1 5)) 0.0001))
  
  (for-loop 1 100 check-n)
)