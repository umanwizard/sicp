(define (fringe lst)
  (cond ((not (list? lst))
         (list lst))
	((null? lst)
	 lst)
	(else
	  (append (fringe (car lst)) (fringe (cdr lst))))))
