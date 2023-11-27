#lang racket

(define (for-each g ls)
  (cond ((not (null? ls))
       (begin (g (car ls))
              (for-each g (cdr ls))))))

(for-each (lambda (x) (newline) (display x))
(list 1 3 4 ))