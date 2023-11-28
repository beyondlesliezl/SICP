#lang racket

(define ls1 (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr ls1)))))

(define ls2 (list (list 7)))
(car (car ls2))

(define ls3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(cdr ls3)
(cdr (car (cdr ls3)))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr ls3))))))))))))