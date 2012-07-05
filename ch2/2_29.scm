(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define left-branch car)

(define right-branch (compose car cdr))

(define branch-length car)

(define branch-structure (compose car cdr))

(define (total-weight mobile)
  (define (branch-weight branch)
    (let ((structure (branch-structure branch)))
      (if (number? structure)
	structure
	(total-weight structure))))
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define (balanced? mobile)
  (define (weight-and-balanced? branch)
    (if (number? (branch-structure branch))
        (cons (branch-structure branch) #t)
	(let ((left-weight-and-balanced? (weight-and-balanced? (left-branch (branch-structure branch))))
	      (right-weight-and-balanced? (weight-and-balanced? (right-branch (branch-structure branch)))))
	  (cons (+ (car left-weight-and-balanced?) (car right-weight-and-balanced?))
		(and
		  (cdr left-weight-and-balanced?)
		  (cdr right-weight-and-balanced?)
		  (= (* (car left-weight-and-balanced?) (branch-length (left-branch (branch-structure branch)))) (* (car right-weight-and-balanced?) (branch-length (right-branch (branch-structure branch)))))))))))
