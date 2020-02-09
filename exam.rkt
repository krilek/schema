#lang racket

(define (delete x l)
    (cond 
        ((null? l) '())
        ((= (car l) x) (cdr l)) 
        (else (cons (car l) (delete x (cdr l))))
   ))
(delete 3 '(1 2 3 4))

(define (count x l i)
  (cond
    ((null? l) i)
    ((= (car l) x) (count x (cdr l) (+ i 1))) 
    (else (count x (cdr l) i))))
(count 2 '(1 2 3 2) 0)

(define (filter pred l)
  (cond
    ((null? l) '())
    ((pred (car l)) (cons (car l) (filter pred (cdr l))))
    (else (filter pred (cdr l)))))
(filter (lambda (x) (= (modulo x 2) 0)) '(1 2 3 4 5 6))

(define (inorder l)
  (cond
    ((null? l) l)
    ;((and (null? (car (cdr l))) (null? (car (cdr (cdr l))))) (car l))
    (else (cons (cons (inorder (car (cdr l))) (car l)) (inorder (car (cdr (cdr l))))  ))))

(define (inorder2 l)
  (cond
    ((null? l) l)
    (else (append (inorder2 (cadr l)) (cons (car l) (inorder2 (car (cdr (cdr l))))))   )))

(define (postorder l)
  (cond
    ((null? l) l)
    (else (append (postorder (cadr l)) (postorder (car (cdr (cdr l)))) (list (car l))))   ))

(define (preorder l)
  (cond
    ((null? l) l)
    (else (append (list (car l)) (preorder (cadr l)) (preorder (car (cdr (cdr l)))) ))   ))

; elem - (car l)
; leftsub - (cadr l)
; rightsub - (caddr l)
(inorder2 '(4
           (3 () ())
           (2 (9 () ()) (7 () ()))))

(postorder '(4
           (3 () ())
           (2 (9 () ()) (7 () ()))))

(preorder '(4
           (3 () ())
           (2 (9 () ()) (7 () ()))))

(define (foldl f z xs)
 (if (null? xs)
  z
  (foldl f (f (car xs) z) (cdr xs))))


(define (member2 elem l)
  (foldl (lambda (x acc) (or acc (= elem x) )) #f l) 
)

(define (member elem l)
  (cond
    ((null? l) #f)
    (else (or (member elem (cdr l)) (= elem (car l))))
  )
)

(member 3 '(1 2 3 4))

; (foldl (lambda (x y) (+ y x)) 0 '(1 2 3 4))

(define (flatten l)
  (cond
    ((null? l) '())
    ((pair? l) (append (flatten (car l)) (flatten (cdr l))))
    (else (list l))
    ))
(flatten `(1 ((2) 3 (4 (5))) 6))


; elem - (car l)
; leftsub - (cadr l)
; rightsub - (caddr l)

(define (square-tree l)
  (cond
    ((null? l) l)
    (else (list (* (car l) (car l)) (square-tree (cadr l))  (square-tree (caddr l)) ))))

(square-tree '(4
           (3 () ())
           (2 (9 () ()) (7 () ()))))

(define (reverse l)
  (cond
    ((null? l) l)
    (else (append (reverse (cdr l)) (list (car l))))))

(reverse '(1 2 3 4))

(define (reverse2 l acc)
  (cond
    ((null? l) acc)
    (else (reverse2 (cdr l) (cons (car l) acc)))))

(reverse2 '(1 2 3 4) '())