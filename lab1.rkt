#lang racket
(define (square x) (* x x))
(define (nwd a b) (if (equal? a b)
                      a
                  (if (> a b)
                    (nwd (- a b) b)
                    (nwd a (- b a))
                    )))
(define (nww a b) (/ (* a b) (nwd a b)))

(define (new.< a b) (< a b))
(define (new.>= a b) (not (new.< a b)))
(define (new.<> a b) (and (new.< a b) (new.< a b)))
; 2 2
; 0 1 1
; 1 2 
; 1 0 0
; 2 1
; 0 1 0
;(define (new.<> a b) (not(and (new.< a b) (new.>= a b))))
;(define (new.= a b) (or (and (new.< a b) (new.>= a b)) (and (not (new.< a b)) (not (new.>= a b))) ))
;(define (rowny a b) (or (and (lewywiekszyrowny a b) (not (lewymniejszy a b))) (and (lewywiekszyrowny a b) (lewymniejszy a b)) ))