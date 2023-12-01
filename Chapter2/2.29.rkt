#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))
;* a ----------------------------------
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;* b ----------------------------------
;需要分为两组，mobile 和 branch来考虑，因为mobile 一定有两个分支，left and right branch
; 而branch可以是mobile，即有两个分支，也可以单纯是数，

(define (branch-weight branch)
  (let ((s (branch-structure branch)))
    (if (pair? s)
        (total-weight-mobile s)
        s)))

(define (total-weight-mobile m)
  (+ (branch-weight (left-branch m))
     (branch-weight (right-branch m))))


;* c ----------------------------------

(define (mobile? structure)
  (pair? structure))

(define (balance-branch? branch)
  (let ((s (branch-structure branch)))
    (if (pair? s)
        (balance-mobile? s)
        #t)))

(define (balance-mobile? mobile)
  (let ((lb (left-branch mobile))
        (rb (right-branch mobile)))
  (and (balance-branch? lb)
       (balance-branch? rb)
       (= (* (branch-weight lb) (branch-length lb))
          (* (branch-weight rb) (branch-length rb))))))
                        


;* d ----------------------------------

;(define (left-branch mobile)
  ;(car mobile))

;(define (right-branch mobile)
   ;(cdr mobile))

;(define (branch-length branch)
  ;(car branch))

;(define (branch-structure branch)
  ;(cdr branch))

;* test ----------------------------------

(define x (make-branch 1 2))
(define b (make-mobile x (make-branch 1 (make-mobile x x))))
(define c (make-mobile (make-branch 1 (make-mobile x x)) (make-branch 1 (make-mobile x x))))

(total-weight-mobile b)
(total-weight-mobile c)

(balance-mobile? b)
(balance-mobile? c)