(define (my-reverse list)
  (let loop ((acc '()) (xs list))
    (if (null? xs) acc
        (loop (cons (car xs) acc) (cdr xs)))))
