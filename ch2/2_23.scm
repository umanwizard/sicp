(define (for-each proc items)
  (or (null? items) (proc (car items)))
  (if (null? items) #f
      (for-each proc (cdr items))))
