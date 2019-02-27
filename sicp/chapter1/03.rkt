#lang sicp

(#%require rackunit)

(define (sum-of-squares-max-two-numbers a b c)
  (cond ((and (> a b) (> c b)) (sum-of-squares a c))
        ((and (> a c) (> b c)) (sum-of-squares a b))
        (else (sum-of-squares b c))))

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(check-equal? (sum-of-squares-max-two-numbers 0 0 0) 0)
(check-equal? (sum-of-squares-max-two-numbers 3 2 1) 13)
(check-equal? (sum-of-squares-max-two-numbers 10 5 9) 181)
(check-equal? (sum-of-squares-max-two-numbers -2 -1 0) 1)
