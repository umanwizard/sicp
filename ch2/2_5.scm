(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (int-log x b)
  (let loop ((acc 0) (v x))
    (if (> b x)
      acc
      (loop (+ acc 1) (quotient v b)))))

(define (car z)
  (int-log ((modulo z 3) 2)))

(define (cdr z)
  (int-log ((modulo z 2) 3)))
