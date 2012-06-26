;the obvious proof that the golden ratio 1 + sqrt(5) is a fixed point of x \goesto 1 + 1/x has been omitted.

;copied from sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))    
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess))

(define phi (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))
