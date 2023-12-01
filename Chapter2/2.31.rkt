#lang racket

(define (tree-map f tree)
  (cond
    ((null? tree) null)
    ((not (pair? tree)) (f tree))
    (else (cons
           (tree-map f (car tree))
           (tree-map f (cdr tree))))))

(define (tree-map-2 f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map-2 f sub-tree)
             (f sub-tree)))
       tree))



(define (square x) (* x x ))

(define (square-tree tree)
  (tree-map square tree))

(define (square-tree-2 tree)
  (tree-map-2 square tree))

(define tree '(1 (2 (3 4) 5 (6 7))))

(square-tree tree)
(square-tree-2 tree)