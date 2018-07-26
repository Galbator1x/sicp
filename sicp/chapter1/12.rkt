#lang racket/base

(require rackunit)

(define (pascal-triangle row col)
  (if (or (= col 1) (= row col))
    1
    (+ (pascal-triangle (- row 1) col)
       (pascal-triangle (- row 1) (- col 1)))))

(check-equal? (pascal-triangle 1 1) 1)
(check-equal? (pascal-triangle 2 1) 1)
(check-equal? (pascal-triangle 3 1) 1)
(check-equal? (pascal-triangle 5 5) 1)
(check-equal? (pascal-triangle 3 2) 2)
(check-equal? (pascal-triangle 5 2) 4)
(check-equal? (pascal-triangle 5 3) 6)
