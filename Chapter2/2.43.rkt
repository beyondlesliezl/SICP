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
         (flatmap
          (lambda (new-row)

            (map (lambda (rest-of-queens)

                   (adjoin-position new-row k rest-of-queens))

                 (queen-cols (- k 1))))

                           (enumerate-interval 1 board-size))

                   ;* rest-of-queens
                     (queen-cols (- k 1))))))
  (queen-cols board-size))


;* Louis 将程序写成上面那样子。将 queen-cols 这个费时的递归计算写在循环内部。因此重复计算了 board-size 次 (queen-cols (- k 1)))。

;* 假设原本时间为 T，重复计算了 board-size 次，时间似乎应该就是 board-size * T。

;* 但是稍等等，计算 (queen-cols k) 时重复计算了 board-size 次 (queen-cols (- k 1))。但在计算 (queen-cols (- k 1)) 时，也重复计算了 board-size 次 (queen-cols (- k 2)), 因而计算 (queen-cols (- k 1)) 本身的时间也慢了。

;* 更一般地，计算 (queen-cols 1) 时，重复了 board-size 次，慢了 board-size 倍。而计算 (queen-cols 2) 时，也重复计算了 board-size 次 (queen-cols 1)，于是叠加起来，就慢了 board-size ^ 2 倍。计算 (queen-cols 3) 时，叠加起来就慢了 board-size ^ 3 倍。

;* 于是计算 (queen-cols board-size)，也就慢了 board-size ^ board-size 倍。

;* 因此，假设原本问题需要时间 T, Louis 将费时的递归计算写在循环内部，就需要用时 (board-size ^ board-size) * T。对于八皇后问题，就需用时 (8 ^ 8) * T = 823543 * T。