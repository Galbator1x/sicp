#lang sicp

(#%require rackunit)

; f(n) = n, if n < 3
; f(n) = f(n - 1) + f(n - 2) + f(n - 3), if n >= 3

(define (f-recursive n)
  (if (< n 3)
    n
    (+ (f-recursive (- n 1))
       (f-recursive (- n 2))
       (f-recursive (- n 3)))))

(define (f-iterative n)
  (define (f-iter a b c count)
    (if (= count 0)
      c
      (f-iter (+ a b c) a b (- count 1))))
  (f-iter 2 1 0 n))

(check-equal? (f-recursive 1) 1)
(check-equal? (f-recursive 2) 2)
(check-equal? (f-recursive 3) 3)
(check-equal? (f-recursive 4) 6)
(check-equal? (f-recursive 10) 230)

(check-equal? (f-iterative 1) 1)
(check-equal? (f-iterative 2) 2)
(check-equal? (f-iterative 3) 3)
(check-equal? (f-iterative 4) 6)
(check-equal? (f-iterative 10) 230)
