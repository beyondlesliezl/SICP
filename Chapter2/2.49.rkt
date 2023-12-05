#lang racket

(define (segments->painter segments-list)
  (lambda (frame)
    (for-each (lambda (segment)
                (draw-line
                 ((frame-coord-map frame) (start-segment segment))
                 ((frame-coord-map frame) (end-segment segment))))

                 segments-list)))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))

(define frame-painter
  (segments->painter (list (make-segment (make-vect 0 0) (make-vect 0 0.99))
                           (make-segment (make-vect 0 0.99) (make-vect 0.99 0.99))
                           (make-segment (make-vect 0.99 0.99) (make-vect 0.99 0))
                           (make-segment (make-vect 0.99 0) (make-vect 0 0)))))

(define cross-painter
  (segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 1))
                           (make-segment (make-vect 0 1) (make-vect 1 0)))))


(define diamond-painter
  (segments->painter (list (make-segment (make-vect 0.0 0.5) (make-vect 0.5 1.0))
                           (make-segment (make-vect 0.5 1.0) (make-vect 1.0 0.5))
                           (make-segment (make-vect 1.0 0.5) (make-vect 0.5 0.0))
                           (make-segment (make-vect 0.5 0.0) (make-vect 0.0 0.5)))))


 (define wave 
   (segments->painter (list 
                       (make-segment (make-vect .25 0) (make-vect .35 .5)) 
                       (make-segment (make-vect .35 .5) (make-vect .3 .6)) 
                       (make-segment (make-vect .3 .6) (make-vect .15 .4)) 
                       (make-segment (make-vect .15 .4) (make-vect 0 .65)) 
                       (make-segment (make-vect 0 .65) (make-vect 0 .85)) 
                       (make-segment (make-vect 0 .85) (make-vect .15 .6)) 
                       (make-segment (make-vect .15 .6) (make-vect .3 .65)) 
                       (make-segment (make-vect .3 .65) (make-vect .4 .65)) 
                       (make-segment (make-vect .4 .65) (make-vect .35 .85)) 
                       (make-segment (make-vect .35 .85) (make-vect .4 1)) 
                       (make-segment (make-vect .4 1) (make-vect .6 1)) 
                       (make-segment (make-vect .6 1) (make-vect .65 .85)) 
                       (make-segment (make-vect .65 .85) (make-vect .6 .65)) 
                       (make-segment (make-vect .6 .65) (make-vect .75 .65)) 
                       (make-segment (make-vect .75 .65) (make-vect 1 .35)) 
                       (make-segment (make-vect 1 .35) (make-vect 1 .15)) 
                       (make-segment (make-vect 1 .15) (make-vect .6 .45)) 
                       (make-segment (make-vect .6 .45) (make-vect .75 0)) 
                       (make-segment (make-vect .75 0) (make-vect .6 0)) 
                       (make-segment (make-vect .6 0) (make-vect .5 .3)) 
                       (make-segment (make-vect .5 .3) (make-vect .4 0)) 
                       (make-segment (make-vect .4 0) (make-vect .25 0)) 
                       )))

