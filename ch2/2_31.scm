(define (tree-map f tree)
  (cond ((not (list? tree))
	 (f tree))
	((null? tree)
	 tree)
	(else
	  (cons (tree-map f (car tree)) (tree-map f (cdr tree))))))
