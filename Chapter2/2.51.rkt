#lang racket

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame new-origin
                             (sub-vect (m corner1) new-origin)
                             (sub-vect (m corner2) new-origin)))))))

(define (below painter1 painter2)
  (let ((split-point (make-vector 0.0 0.5)))
    (let ((paint-up
           (transform-painter painter2
                              split-point
                              (make-vector 1.0 0.5)
                              (make-vector 0.0 1.0)))
          (paint-below
           (transform-painter painter1
                              (make-vector 0.0 0.0)
                              (make-vector 1.0 0.0)
                              split-point)))
    (lambda (frame)
      (paint-below frame)
      (paint-up frame)))))
                     

(define (below-2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))