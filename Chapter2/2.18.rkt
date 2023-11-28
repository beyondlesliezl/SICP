#lang sicp

(define (reverse list)
  (define (iter list result)
    (if (null? list)
        result
        (iter (cdr list) (cons (car list) result))))
  (iter list nil))

(reverse (list 1 2 3 4 5 6 7))

(define (reverse-recursive lst)
  (if (null? lst)
      '()
      (append (reverse-recursive (cdr lst)) (list (car lst)))))

(reverse-recursive (list 1 2 3 4 5 6 7))