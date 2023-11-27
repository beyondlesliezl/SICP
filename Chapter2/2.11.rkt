#lang racket

(define (mul-interval x y)
  (let ((l_x (lower-bound x))
        (u_x (upper-bound x))
        (l_y (lower-bound y))
        (u_y (upper-bound y)))

      (cond ((< u_x 0)  ; x 全为负
              (cond ((< u_y 0) (make-interval (* u_x u_y) (* l_x l_y)))     ; y 全为负
                    ((> l_y 0) (make-interval (* l_x u_y) (* u_x l_y)))     ; y 全为正
                    (else      (make-interval (* l_x u_y) (* l_x l_y)))))   ; y 跨过 0

            ((> l_x 0)  ; x 全为正
              (cond ((< u_y 0) (make-interval (* u_x l_y) (* l_x u_y)))     ; y 全为负 
                    ((> l_y 0) (make-interval (* l_x l_y) (* u_x u_y)))     ; y 全为正
                    (else      (make-interval (* u_x l_y) (* u_x u_y)))))   ; y 跨过 0

            (else           ; x 跨过 0
              (cond ((< u_y 0) (make-interval (* u_x l_y) (* l_x l_y)))     ; y 全为负 
                    ((> l_y 0) (make-interval (* l_x u_y) (* u_x u_y)))     ; y 全为正
                    (else      (make-interval (min (* u_x l_y) (* l_x u_y)) ; y 跨过 0
                                              (max (* l_x l_y) (* u_x u_y)))
                    )))
            )))
                     