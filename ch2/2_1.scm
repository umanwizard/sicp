(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d)))
	(sgn (if (< (/ n d) 0) -1 1)))
    (cons (* sgn (/ (abs n) g)) (/ (abs d) g))))
