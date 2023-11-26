#lang racket

(define (runtime) (current-inexact-milliseconds)) 
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 4)
      (begin (report-prime n (- (runtime) start-time))
             #t)
      #f))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " is prime: ")
  (display elapsed-time))

;*---------------------------------------------------------------

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even?  exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
         (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


;*---------------------------------------------------------------

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