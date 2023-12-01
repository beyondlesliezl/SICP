#lang racket


(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (* sub-tree sub-tree)))
             tree))

(define (square-tree-2 tree)
  (cond
    ((null? tree) null)
    ((not (pair? tree)) (* tree tree))
    (else (cons (square-tree-2 (car tree))
                (square-tree-2 (cdr tree))))))

(define tree
 (list 1 
       (list 2 (list 3 4) 5)
       (list 6 7)))

(square-tree-2 tree)

(square-tree tree)