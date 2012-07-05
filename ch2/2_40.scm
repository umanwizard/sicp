(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
(define (enumerate-interval k n)
  (if (> k n)
      '()
      (cons k (enumerate-interval (add1 k) n))))
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
	   (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

