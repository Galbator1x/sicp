#lang sicp

(#%require rackunit)

(define (* a b)
  (define (iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (iter (double a) (halve b) acc))
          (else (iter a (- b 1) (+ acc a)))))
  (iter a b 0))

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(check-equal? (* 1 1) 1)
(check-equal? (* 5 1) 5)
(check-equal? (* 1 2) 2)
(check-equal? (* 2 2) 4)
(check-equal? (* 2 3) 6)
(check-equal? (* 3 10) 30)
(check-equal? (* 4 0) 0)
(check-equal? (* 5 5) 25)
(check-equal? (* 7 9) 63)
