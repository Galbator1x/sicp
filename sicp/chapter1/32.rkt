#lang sicp

(#%require rackunit)

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (inc n) (+ n 1))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate-recursive combiner null-value term (next a) next b))))

(define (sum-recursive term a next b)
  (accumulate-recursive + 0 term a next b))

(define (product-recursive term a next b)
  (accumulate-recursive * 1 term a next b))

(check-equal? (sum identity 1 inc 5) 15)
(check-equal? (product identity 1 inc 5) 120)
(check-equal? (sum-recursive identity 1 inc 5) 15)
(check-equal? (product-recursive identity 1 inc 5) 120)
