#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (map (lambda (jk-pair) (append jk-pair (list i)))

                  (flatmap (lambda (j)
                             (map (lambda (k) (list k j))
                                  (enumerate-interval 1 (- j 1))))

                           (enumerate-interval 1 (- i 1)))))

           (enumerate-interval 1 n)))

(define (triplet-sum triplet)
  (+ (car triplet) (cadr triplet) (cadr (cdr triplet))))

(define (make-triplet-sum triplet)
  (append triplet (list (triplet-sum triplet))))

(define (triplet-sum-equal? s)
  (lambda (triplet) (= (triplet-sum triplet) s)))


(define (sum-equal-triplets n s)
  (map make-triplet-sum
       (filter (triplet-sum-equal? s)
               (unique-triples n))))

(sum-equal-triplets 5 10)