
(define-macro (def func args body)
  ; 编写scheme的def语句
  `(define ,func (lambda ,args ,body))
)

; stream类似于python中的generator
(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define all-three-multiples
  (cons-stream 3 (map-stream (lambda (x) (+ x 3)) all-three-multiples))
)


(define (compose-all funcs)
  (lambda (x)
    (if (null? funcs)
      x
      ((compose-all (cdr funcs)) ((car funcs) x))
    )
  )
)


(define (partial-sums stream)
  'YOUR-CODE-HERE
  (define helper
    (lambda (sum stream)
      (if (null? stream)
        nil
        (cons-stream (+ sum (car stream)) (helper (+ sum (car stream)) (cdr-stream stream)))
      )
    )
  )
  (helper 0 stream)
)

