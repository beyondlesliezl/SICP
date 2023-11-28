#lang racket

(define (make-rat n d)
  (define (neg? x) (< x 0))
  (define (make-neg x)
    (if (< x 0) x
        (- 0 x)))
  (let ((g (gcd n d)))
    (cond
      ((and (neg? n) (neg? d))
       (cons (abs (/ n g)) (abs (/ d g))))
      ((or (neg? n) (neg? d))
        (cons (make-neg (/ n g)) (abs (/ d g))))
        (else (cons (/ n g) (/ d g))))))


(define (print-rat x)
    (newline)
    (display (number x))
    (display "/")
    (display (denom x)))

(define (number x) (car x))
(define (denom x) (cdr x))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(print-rat (make-rat 0 -4))
(print-rat (make-rat 2 -8))
(print-rat (make-rat -2 -8))
(print-rat (make-rat 2 -8))
(print-rat (make-rat -2 8))