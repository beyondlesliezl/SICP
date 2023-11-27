#lang sicp

(define (iterative-imporve good-enough? improve)
  (lambda (x)
    (if (good-enough? x)
        x
        ((iterative-imporve good-enough? improve) (improve x)))))

(define (sqrt-iter guess x)

  (define (improve guess)
    (average guess (/ x guess)))

  (define (average x y) (/ (+ x y) 2))

  (define (good-enough? guess)
    (let ((next (improve guess)))
      (< (abs (- next guess)) 0.001)))

  ((iterative-imporve good-enough? improve) guess))

(sqrt-iter 1.0 2)


(define tolerance 0.000001)

(define (fixed-point f first-guess)

  (define (good-enough? v1)
         (< (abs (- v1 (improve v1))) tolerance))

  (define (improve guess)
    (f guess))

  ((iterative-imporve good-enough? improve) first-guess))

(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)