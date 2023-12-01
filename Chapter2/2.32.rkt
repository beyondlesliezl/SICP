#lang racket

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x)
                            (cons (car s) x))
                             rest)))))

(define s (list 1 2 3))
(subsets s)

;* 一部分包含 (car s),另外一部分不包含（car s)