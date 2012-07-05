(define (fringe lst)
  (cond ((not (list? lst))
         (list lst))
	((null? lst)
	 lst)
	(else
	  (append (fringe (car lst)) (fringe (cdr lst))))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (fringe t))))
