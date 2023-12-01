#lang racket

;* old version
(define (count-leaves-old x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves-old (car x))
                 (count-leaves-old (cdr x))))))

;* new version
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y)
                (+ (if (pair? x)
                       (count-leaves x)
                       1)
                   y))
              0
              (map  (lambda (x) x) t)))

(define (count-leaves-2 t)
  (accumulate +
              0
              (map (lambda (x)
                     (if (pair? x)
                         (count-leaves x)
                         1))
                   t)))

(count-leaves '(1 (2 3) (4 5 (6 7))))