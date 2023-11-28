#lang racket

(define (make-segment point1 point2)
  (cons point1 point2))

(define (start-segment line)
  (car line))

(define (end-segment line)
  (cdr line))


(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-size width height)
  (cons width height))

(define (width-size s)
  (car s))

(define (height-size s)
  (cdr s))

(define (rectangle x y width height)
  (cons (make-point x y) (make-size width height)))

(define (perimeter-rect rt)
  (let ((size (cdr rt)))
  (* 2 (+ (width-size size) (height-size size)))))

(define (area-rect rt)
  (let ((size (cdr rt)))
  (* (width-size size) (height-size size))))


;* min-point, max-point
(define (make-rect2 x y width height)
  (cons (make-point x y) (make-point (+ x width) (+ y height))))

(define (perimeter-rect2 rt)
  (let ((min-pt (car rt)) 
        (max-pt (cdr rt)))
       (* 2
          (+ (- (x-point max-pt) (x-point min-pt))
             (- (y-point max-pt) (y-point min-pt))))))

(define (area-rect2 rt)
  (let ((min-pt (car rt))
        (max-pt (cdr rt)))
       (* (- (x-point max-pt) (x-point min-pt))
          (- (y-point max-pt) (y-point min-pt)))))
