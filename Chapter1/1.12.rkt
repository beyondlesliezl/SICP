#lang sicp

(define (pascal-row n)
  (define (next-row lst)
    (if (= (length lst) 1)
        (list (car lst) (car lst))
        (let ((ret (next-row (cdr lst)))
              (first (car lst)))
              (cons first (cons (+ first (car ret) (cdr ret)))))))
  (if (<= n 1)
      (list 1)
      (next-row (pascal-row (- n 1)))))

; 在设置base case 之后，就可以引用自身来进行计算了
; 在此例中，就是 (next-row (cdr lst))