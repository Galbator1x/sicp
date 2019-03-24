#lang sicp

(#%require rackunit)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc n) (+ n 1))

(check-equal? (sum identity 1 inc 5) 15)
