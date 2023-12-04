#lang racket


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (queens board-size) ;* 一列一列来考虑
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board) ;* base-case

        (filter ;* 对所有情况进行筛选

         (lambda (positions) (safe? k positions)) ;* 筛选的条件, positions就是一种情况

         ;*接下来生成 所有可能的情况
         ;* 在已经生成了k-1个皇后，生成k个皇后
         (flatmap  (lambda (rest-of-queens) ;* 是在前k-1列放置k-1个皇后的一种方式
                     
                     (map  (lambda (new-row) ;* 是在第k列放置所考虑的行的编号

                             (adjoin-position new-row k rest-of-queens))

                           (enumerate-interval 1 board-size)))

                   ;* rest-of-queens
                     (queen-cols (- k 1))))))
  (queen-cols board-size))

;* --------------------------------------------------------------------------------

(define empty-board null) ;* pair 第一个表示这是第几行， 第二个表示这是第几列

;* 还是反着放比较好
(define (adjoin-position new-row k rest-of-queens) ;* 第k 列
  (cons (list new-row k) rest-of-queens))

(define (safe? k positions)

  (define (same-row? k-queen rest-of-queens)
    (cond 
      ((null? rest-of-queens) #t)
      ((= (car k-queen) (car (car rest-of-queens))) #f)
      (else (same-row? k-queen (cdr rest-of-queens)))))

  (define (dg k-queen)
    (+ (car k-queen) (cadr k-queen)))

  (define (udg k-queen k)
    (+ (- (cadr k-queen) (car k-queen)) k))

  (define (same-dg? k-queen rest-of-queens)
    (cond
      ((null? rest-of-queens) #t)
      ((= (dg k-queen) (dg (car rest-of-queens))) #f)
      (else (same-dg? k-queen (cdr rest-of-queens)))))

  (define (same-udg? k-queen rest-of-queens k)
    (cond
      ((null? rest-of-queens) #t)
      ((= (udg k-queen k) (udg (car rest-of-queens) k)) #f)
      (else (same-udg? k-queen (cdr rest-of-queens) k))))

  (cond
    ((or (= k 1) (= k 0)) #t)
    ((null? (cdr positions)) #t)
    (else (and 
           (same-row? (car positions) (cdr positions))
           (same-dg? (car positions) (cdr positions))
           (same-udg? (car positions) (cdr positions) k)))))

(queens 8)

(define (sum-ways sequence)
  (if (null? sequence)
      0
      (+ 1 (sum-ways (cdr sequence)))))

(sum-ways (queens 8)) ;* 92!!!!
