#lang sicp

(#%require rackunit)

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product identity 1 inc n))

(define (inc n) (+ n 1))

(define (pi)
  (define (next n)
    (if (= n 2)
      2
      (* n n)))
  (* 4 (/ (product identity 2 next 10)
          (product identity 3 next 10))))

(define (recursive-product term a next b)
  (if (> a b)
    1
    (* (term a) (recursive-product term (next a) next b))))

(define (factorial2 n)
  (recursive-product identity 1 inc n))

(check-equal? (factorial 0) 1)
(check-equal? (factorial 1) 1)
(check-equal? (factorial 5) 120)
(check-equal? (factorial2 0) 1)
(check-equal? (factorial2 1) 1)
(check-equal? (factorial2 5) 120)
