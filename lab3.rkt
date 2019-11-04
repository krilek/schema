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
(define (odd? x) (if (= x 0) #f (even? (- x 1))))
(define (even? x) (if (= x 0) #t (odd? (- x 1))))
(define (fibiter a b n) (if (= n 0) b (fibiter (+ a b) a (- n 1))))
(define (fib n) (fibiter 1 0 n))
(define (call fun arg) (fun arg))
;;10
(define (new-if warunek alternatywa1 alternatywa2)
   (cond (warunek alternatywa1)
         (else    alternatywa2)))
;;11
(define (silr n) (new-if (< n 1) 1 (* n (silr (- n 1)))))
(define (siliter a b c) (if (= b c) (* a b) (siliter (* a b) (+ b 1) c)))
(define (sil n) (siliter 1 1 n))
;;12
(define m 1)
(define (p m) (pp 5))
(define (pp x) (+ x m))

(define n 1)
(define (q n) (define (qq x) (+ x n)) (qq 5))


;;17
(define (iter f n) (lambda (x) (if (= n 0) x ((iter f (- n 1)) (f x)))))
;;18
(define (f g) (g 2))
;;19
;;a
(define (append l m)
  (cond ((null? l)
         m)
        (else
         (cons (car l)
               (append (cdr l) m)))))
;;b
(define (reverse lis)
   (if (null? lis)
       '()
       (append (reverse (cdr lis)) (list (car lis)))))
;;c
(define (last l)
  (cond ((null? (cdr l)) (car l)) ;; jesli ogon juz jest nullem to zwroc glowe
        (else (last (cdr l)))))
;;d
(define (delete x l)
  (cond ((null? l) '())
        ((= (car l) x) (delete x (cdr l)))
        (else (cons (car l) (delete x (cdr l))))
   )
)
;;20ab
(define (mapf f l)
  (cond ((null? l) '())
        (else (cons (f (car l))(mapf f (cdr l))))
))
;;20c
(define (filter pred l)
  (cond ((null? l) '())
        ((pred (car l)) (cons (car l) (filter pred (cdr l))))
        (else (filter pred (cdr l)))
  )
)
