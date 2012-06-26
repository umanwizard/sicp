(define (cont-frac n d k)
  (let cont-frac-iter ((acc (/ (n k) (d k))) (i (- k 1)))
    (if (zero? i) acc
      (cont-frac-iter (/ (n i) (+ (d i) acc)) (- i 1)))))

(define (phi-recip k) (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)) ;rounds off correctly to 0.6180 at k = 10
