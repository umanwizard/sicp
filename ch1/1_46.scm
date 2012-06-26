(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (let loop ((x guess))
      (if (good-enough? x)
	  x
	  (loop (improve x))))))

(define (my-sqrt x)
  ((iterative-improve
    (lambda (guess)
      (< (abs (- (* guess guess) x)) 0.001))
    (lambda (guess)
      (/ (+ guess (/ x guess)) 2))) 1))

(define (fixed-point f first-guess)
  ((iterative-improve
     (lambda (guess)
       (< (abs (- guess (f guess))) 0.00001))
     (lambda (guess)
       (f guess))) first-guess))
