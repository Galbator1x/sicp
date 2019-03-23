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
    (define (next x)
      (if (= x 2) 3 (+ x 2)))
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= n (smallest-divisor n)))

(define (square x) (* x x))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

#| 1009 *** 2 |#
#| 1013 *** 2 |#
#| 1019 *** 2 |#

#| 100003 *** 9 |#
#| 100019 *** 8 |#
#| 100043 *** 8 |#

#| 1000003 *** 23 |#
#| 1000033 *** 23 |#
#| 1000037 *** 23 |#
