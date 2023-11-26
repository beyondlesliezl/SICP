#lang racket

(define (smallest-divisor n)
  (find-divisor n 2))

(define (square x) (* x x ))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (cond ((= n 1) #f)
        (else (= n (smallest-divisor n)))))

;* ---------------------------------------------------------------------------------

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond
    ((> a b) null-value)
    ((filter a) (combiner (term a)
                (filtered-accumulate combiner null-value term (next a) next b filter)))
    (else (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (filtered-accumulate-iterator combiner null-value term a next b filter)
  (define (iter a result)
    (cond
      ((> a b) result)
      ((filter a) (iter (next a) (combiner (term a) result)))
      (else (iter (next a) result))))
  (iter a null-value))

;* ---------------------------------------------------------------------------------
(define (identity x) x)
(define (increment x) (+ x 1))

(define (find-prime-sum a b)

  (define (combiner a b)
    (+ a b))
    
  (filtered-accumulate  combiner 0  identity a increment b prime?))

(find-prime-sum 2 10)(+ 2 3 5 7)
(find-prime-sum 2 20) (+ 2 3 5 7 11 13 17 19)
;* ---------------------------------------------------------------------------------

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (less-n-prime-sum n)
  (define (combiner a b) (* a b))

  (define (relatively-prime? x)
    (if (= (gcd x n) 1)
        #t
        #f))

  (filtered-accumulate combiner 1 identity 0  increment n relatively-prime?))
      

(module* test #f
  (require rackunit)
  (check-equal? (find-prime-sum 2 10) (+ 2 3 5 7))
  (check-equal? (find-prime-sum 2 20) (+ 2 3 5 7 11 13 17 19))
  
  (check-equal? (less-n-prime-sum 10) (* 1 3 7 9))
  (check-equal? (less-n-prime-sum 20) (* 1 3 7 9 11 13 17 19))
)