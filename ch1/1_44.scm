(define (repeated f n)
  (if (= n 1) (lambda (x) (f x))
    (lambda (x) (f ((repeated f (- n 1)) x)))))

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
