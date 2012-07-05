(define (square-tree tree)
  (define (square x) (* x x))
  (cond ((not (list? tree))
	 (square tree))
	((null? tree)
	 tree)
	(else
	  (cons (square-tree (car tree)) (square-tree (cdr tree))))))
