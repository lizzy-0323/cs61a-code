(define (rle s)
    (define (helper v cnt s) 
      (cond 
          ((null? s) (cons-stream (list v cnt) nil))
          ((equal? v (car s)) (helper v (+ cnt 1) (cdr-stream s)))
          (else (cons-stream (list v cnt) (helper (car s) 1 (cdr-stream s))))
      )
    )
    (if (null? s) nil (helper (car s) 1 (cdr-stream s)))
)

(define (helper2 curr s ans)
    (if (and (not (null? s)) (<= curr (car s))) (helper2 (car s) (cdr-stream s) (append ans (list (car s))))
        ans 
    )
)
(define (next s curr)
    (if (null? s) nil
    (if (>= (car s) curr) (next (cdr-stream s) (car s)) s
    )
)
)
(define (group-by-nondecreasing s)
    (if (null? s) nil
        (cons-stream (helper2 (car s) (cdr-stream s) (list (car s))) (group-by-nondecreasing (next s (car s))))
    )   
)




(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

