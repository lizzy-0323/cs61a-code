(define (split-at lst n)
	(define (take lst n)
		(if (or (null? lst) (= n 0))
			'()
			(cons (car lst) (take (cdr lst) (- n 1))))
	)
	(define (drop lst n)
		(if (or (null? lst) (= n 0))
			lst
			(drop (cdr lst) (- n 1)))
	)
	(define (length lst)
		(if (null? lst)
			0
			(+ 1 (length (cdr lst))))
	)
	(if(> n (length lst))
		(cons lst ())
		(cons (take lst n) (drop lst n))
	)

)


(define-macro (switch expr cases)
              (let ((val (eval expr)))
                   (cons `cond
                         (map (lambda (case)
                                      (cons (eq? val (car case)) (cdr case))
                              )
                              cases
                         )
                   )
              )
)

