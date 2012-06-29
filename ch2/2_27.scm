(define (deep-reverse list)
  (if (not (list? list))
      list
      (let loop ((acc '()) (xs list))
        (if (null? xs) acc
            (loop (cons (deep-reverse (car xs)) acc) (cdr xs))))))
