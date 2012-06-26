(define (average x y)
  (/ (+ x y) 2))

(define (repeated f n)
  (if (= n 1) (lambda (x) (f x))
    (lambda (x) (f ((repeated f (- n 1)) x)))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess))

(define (int-log x b)
  (let loop ((acc 0) (v x))
    (if (> b x)
        acc
	(loop (+ acc 1) (quotient v b)))))

(define (nth-root x n i)
  (let ((i (int-log n 2))) ;found through experimentation as suggested in the exercise. Not proven to work.
  (fixed-point-of-transform (lambda (y) (/ x (expt y (- n 1)))) (repeated average-damp i) 1)))
