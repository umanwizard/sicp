(define (cont-frac n d k)
  (let cont-frac-iter ((acc (/ (n k) (d k))) (i (- k 1)))
    (if (zero? i) acc
      (cont-frac-iter (/ (n i) (+ (d i) acc)) (- i 1)))))

(define (tan-cf x k) (cont-frac (lambda (i) (if (= i 1) x (- (* x x)))) (lambda (i) (- (* 2 i) 1)) k))
