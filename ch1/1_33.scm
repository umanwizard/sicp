(define (square x)
  (* x x))

(define (inc x)
  (+ 1 x))

(define (filtered-accumulate filter? combiner null-value term a next b)
  (let loop ((acc null-value) (k a))
    (if (> k b)
        acc
	(loop (if (filter? k) (combiner (term k) acc) acc) (next k)))))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (sum-of-relative-primes n)
  (filtered-accumulate (lambda (k) (= (my-gcd n k) 1)) + 0 identity 1 inc (- n 1)))

(define (my-gcd n k)
  (let euclid ((a n) (b k))
    (cond ((> b a) (euclid b a))
	  ((= b 0) a)
	  (else (euclid b (modulo a b))))))
