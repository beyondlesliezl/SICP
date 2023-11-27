#lang sicp

(define (last-pair ls)
  (define (iter atom ls)
    (if (null?  ls)
    atom
    (iter (car ls) (cdr ls))))
    (iter nil ls))

(define (last-pair-2 items)
  (if (null? (cdr items))
      (car items)
      (last-pair-2 (cdr items))))



(last-pair (list 23 72 149 34))
(last-pair (list 23 72 12 33))