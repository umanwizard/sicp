(define (cont-frac n d k)
  (let cont-frac-iter ((acc (/ (n k) (d k))) (i (- k 1)))
    (if (zero? i) acc
      (cont-frac-iter (/ (n i) (+ (d i) acc)) (- i 1)))))

(define (e-cf k) (+ 2(cont-frac (lambda (i) 1.0) (lambda (i) (if (= 2 (modulo i 3)) (* 2 (+ 1 (quotient i 3))) 1)) k)))
