#lang racket
;(define (evenIter n i val) (if (zero? i) (evenIter n (+ i 1) ) 3))
(define (odd? x) (if (= x 0) #f (even? (- x 1))))
(define (even? x) (if (= x 0) #t (odd? (- x 1))))
(define (fibrec n) (if (= n 0) 0 (if (= n 1) 1 (+ (fibrec (- n 1) ) (fibrec (- n 2))))))
(define (fibiter a b n) (if (= n 0) b (fibiter (+ a b) a (- n 1))))
(define (fib n) (fibiter 1 0 n))
(define (expR b e) (if (= e 0) 1 (if (odd? e) (* b (*(expR b (/(- e 1) 2)) (expR b (/(- e 1) 2)))) (* (expR b (/ e 2)) (expR b (/ e 2))))))
;(define (expIter b e n) (if (= e 0) 1 (if (odd? e) (* b (*(expR b (/(- e 1) 2)) (expR b (/(- e 1) 2)))) (* (expR b (/ e 2)) (expR b (/ e 2))))))
