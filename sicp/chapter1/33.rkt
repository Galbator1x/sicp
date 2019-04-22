#lang sicp

(#%require rackunit)

(define (filtered-accumulate combiner filter null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (if (filter a)
        (iter (next a) (combiner result (term a)))
        (iter (next a) result))))
  (iter a null-value))

(define (inc n) (+ n 1))
(define (square n) (* n n))

(define (sum-of-prime-squares a b)
  (filtered-accumulate + prime? 0 square a inc b))

(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (if (= n 1) false (= n (smallest-divisor n))))

(check-equal? (sum-of-prime-squares 1 5) 38)
(check-equal? (sum-of-prime-squares 1 10) 87)
