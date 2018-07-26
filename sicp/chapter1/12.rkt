#lang racket/base

(require rackunit)

(define (f row col)
  (if (or (= col 1) (= row col))
    1
    (+ (f (- row 1) col)
       (f (- row 1) (- col 1)))))

(check-equal? (f 1 1) 1)
(check-equal? (f 2 1) 1)
(check-equal? (f 3 1) 1)
(check-equal? (f 5 5) 1)
(check-equal? (f 3 2) 2)
(check-equal? (f 5 2) 4)
(check-equal? (f 5 3) 6)
