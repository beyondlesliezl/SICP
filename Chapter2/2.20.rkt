#lang racket

(define (same-parity x . y)
  (define (filter g ls)
    (cond
      ((null? ls) `())
      ((g (car ls)) (cons (car ls) (filter g (cdr ls))))
      (else (filter g (cdr ls)))))

  (cond
    ((null? y) (list x))
    ((even? x) (cons x (filter even? y)))
    ((odd? x) (cons x (filter odd? y)))))


(define (same-parity-2 a . w)
  (cons a 
        (filter (lambda (x) (even? (+ a x)))
                w)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
(same-parity 1 2 3 4 5 7 9 10)
(same-parity 2 3 4 5 6 7 8 9 10)