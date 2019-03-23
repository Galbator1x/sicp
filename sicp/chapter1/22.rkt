#lang sicp

(#%require rackunit)

(define (search-for-primes a b)
  (if (<= a b)
    ((if (not (even? a)) (timed-prime-test a))
     (search-for-primes (+ a 1) b))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= n (smallest-divisor n)))

(define (square x) (* x x))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

#| 1009 *** 2 |#
#| 1013 *** 1 |#
#| 1019 *** 2 |#

#| 100003 *** 12 |#
#| 100019 *** 11 |#
#| 100043 *** 15 |#

#| 1000003 *** 28 |#
#| 1000033 *** 27 |#
#| 1000037 *** 27 |#
