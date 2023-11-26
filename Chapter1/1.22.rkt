#lang racket

(define (runtime) (current-inexact-milliseconds)) 

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x ))

;* ---------------------------------------------------------------
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (begin (report-prime n (- (runtime) start-time))
             #t)
      #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " is prime")
  (display elapsed-time))

;* ---------------------------------------------------------------

(define (even? x)
  (= (remainder x 2) 0))

(define (search-for-primes n count)
  (define (make-odd x)
    (if (even? x)
        (+ x 1)
        x))
  (define  (iter-odd n count)
    (cond
      ((not (= count 0))
            (if (timed-prime-test n)
                (iter-odd (+ n 2) (- count 1))
                (iter-odd (+ n 2) count)))))
                (iter-odd (make-odd n) count))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
(search-for-primes 10000000 3)
(search-for-primes 100000000 3)