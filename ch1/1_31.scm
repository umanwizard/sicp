(define (inc x) (+ x 1))

(define (product-rec f a next b)
  (if (> a b) 1
      (* (f a) (product-rec f (next a) next b))))

(define (fact n)
  (product-rec identity 1 inc n))

(define (estimate-pi n)
  (define (num-term k)
    (+ k (if (even? k) 2 1)))
  (define (denom-term k)
    (+ k (if (even? k) 1 2)))
  (* 4 (product-iter (lambda (k) (/ (num-term k) (denom-term k))) 1 inc n)))

(define (product-iter f a next b)
  (let loop ((accum 1) (x a))
    (if (> x b) accum
      (loop (* accum (f x)) (next x)))))
