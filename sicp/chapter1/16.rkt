#lang sicp

(#%require rackunit)

(define (expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (square b) (/ n 2) a))
          (else (iter b (- n 1) (* a b)))))
  (iter b n 1))

(define (square n) (* n n))

(check-equal? (expt 1 3) 1)
(check-equal? (expt 1 10) 1)
(check-equal? (expt 2 0) 1)
(check-equal? (expt 2 1) 2)
(check-equal? (expt 2 2) 4)
(check-equal? (expt 2 3) 8)
(check-equal? (expt 2 4) 16)
(check-equal? (expt 2 10) 1024)
