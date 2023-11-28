#lang racket

(define (reverse-depth list)
  (define (iter list result)
    (cond
      ((null? list) result)
      ((pair? (car list)) (iter (cdr list) (cons (reverse-depth (car list))
                                                 result)))
      (else (iter (cdr list) (cons (car list) result)))))
      (iter list `()))

(define x (list (list 1 2) (list 3 4)))

(reverse-depth x)
