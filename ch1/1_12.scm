(define (pascal n k)
  (cond ((zero? n) 1)
	((or (zero? k) (< k 0) (= k n) (> k n)) 1)
	(else (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k)))))
