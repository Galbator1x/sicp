#lang sicp

(#%require rackunit)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (prime? n) (fast-prime? n 100))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (square x) (* x x))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

#| 1009 *** 81 |#
#| 1013 *** 100 |#
#| 1019 *** 104 |#

#| 100003 *** 141 |#
#| 100019 *** 142 |#
#| 100043 *** 141 |#

#| 1000003 *** 158 |#
#| 1000033 *** 158 |#
#| 1000037 *** 161 |#
