; This works because the powerset of {} is {{}} , and because the powerset of {a} U S is the powerset of S alogn with the powerset of S with each subset of S having {a} appended to it.
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (subset) (cons (car s) subset)) rest)))))
