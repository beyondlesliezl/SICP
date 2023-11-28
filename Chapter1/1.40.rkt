#lang racket

(define (cubic a b c)
  (define (cub x) (* x x x))
  (define (square x) (* x x))
  (lambda (x)
  (+ (cub x) (* a (square x)) (* b x) c)))

(define (newtons-method g guess)
  (fixed-point (newtons-transform g) guess))

(define (newtons-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
          dx)))

(define dx 0.00001)

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

(newtons-method (cubic 0 0 1) 1)
(newtons-method (cubic 3 2 1) 1.0)  ; -2.3247179572447
(newtons-method (cubic 3 4 5) 1.0)  ; -2.2134116627622
(newtons-method (cubic 6 7 8) 1.0)  ; -4.9054740060655