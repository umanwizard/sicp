(define (accumulate combiner null-value term a next b)
  (let loop ((acc null-value) (k a))
    (if (> k b)
        acc
	(loop (combiner (term k) acc) (next k)))))

(define (product f a next b)
  (accumulate * 1 f a next b))

(define (sum f a next b)
  (accumulate + 0 f a next b))
