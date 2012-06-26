(define make-interval cons)
;2.7
(define upper-bound cdr)
(define lower-bound car)

;2.8
(define (sub-interval x y)
  (make-iterval (- (lower-bound x) (upper-bound y))
		(- (upper-bound x) (lower-bound y))))

;2.9
;width of (add-interval x y) === width of x + width of y
;same for width of (sub-interval x y)
;(the proof for both is obvious)
;width of (mul-interval x y) is not a function of width of x and width of y:
;e.g. width of [0..1] * [0..1] == [0..1] is 1, but width of [1..2] * [1..2] = [1..4] is 3
;same goes for division. Width of [1..2] / [1..2] == [1/2 .. 2] is 1.5, whereas width of [2..3] / [2..3] == [2/3 .. 3/2] is 1 + 5/6

;2.10
(define (div-interval x y)
  (define (spans-zero? int)
    (let ((low (lower-bound int))
	  (upp (upper-bound int)))
      (or (= low 0) (= upp 0) (and (< low 0) (> upp 0)))))
  (define (do-div-interval a b)
    (mul-interval a (make-interval (/  1.0 (upper-bound b)) (/ 1.0 (lower-bound b)))))
  (if (or (spans-zero? x) (spans-zero? y))
      (error "One of the intervals provided to div-interval spans zero!")
      (do-div-interval x y)))

;2.11

