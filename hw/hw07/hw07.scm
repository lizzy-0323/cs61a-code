(define (cddr s) (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
    )

(define (caddr s)
  (car (cdr (cdr s)))
)


(define (sign num)
  (cond ((> num 0) 1)
    ((< num 0) -1)
    (else 0)
)

)

(define (square x) (* x x))

(define (pow x y)
  (if (= y 0)
      1
      (if (even? y)
          (square (pow x (/ y 2)))
          (* x (square(pow x (/ (- y 1) 2)))
          )
      )
  )
)

(define (unique s)
  (if (null? s)
      nil
      (cons (car s) (unique (filter (lambda (x) (not (eq? x (car s)))) (cdr s))))
  )
)

(define (replicate x n)
  (define (replicate-tail-recursion x n result)
     (if (= n 0)
         result
         (replicate-tail-recursion x (- n 1) (append result (list x)))
  ))
  (replicate-tail-recursion x n nil) 
)

(define (accumulate combiner start n term)
(define (accumulate-helper combiner start n term)
  (if (= n 0)
      start
      (combiner (term n) (accumulate-helper combiner start (- n 1) term))
  )
)
(accumulate-helper combiner start n term)
)
;使用尾递归 
(define (accumulate-tail combiner start n term)
  (define (accumulate-tail-helper combiner start n term result)
    (if (= n 0)
        result
        (accumulate-tail-helper combiner start (- n 1) term (combiner (term n) result))
    )
  )
  (accumulate-tail-helper combiner start n term start)
)

; for循环macro
; (define-macro (for var in lst body)
;   (list 'accumulate-tail 'cons '() (list 'lambda (list var) body) (list 'length lst))
; )

(define-macro
 (list-of map-expr for var in lst if filter-expr)
 `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)

