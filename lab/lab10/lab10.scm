(define (over-or-under num1 num2)
  'YOUR-CODE-HERE
  (if (> num1 num2)
    1
    (if (< num1 num2)
      -1
      0))
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0


(define (filter-lst fn lst)
  'YOUR-CODE-HERE
  ; 对lst中每个元素应用fn
  ; 如果fn返回true，就把这个元素加到结果列表中
  ; 否则，就不加
  (if (null? lst)
    nil
    (if (fn (car lst))
      (cons (car lst) (filter-lst fn (cdr lst)))
      (filter-lst fn (cdr lst))))
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)


(define (make-adder num)
  'YOUR-CODE-HERE
  (lambda (x) (+ num x))
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13


(define lst 
  (cons (cons 1 nil)
        (cons 2 (cons (cons 3 (cons 4 nil))
                      (cons 5 nil))))
)


(define (composed f g)
  'YOUR-CODE-HERE
  (lambda (x) (f (g x)))
)


(define (remove item lst)
  'YOUR-CODE-HERE
  (filter-lst ((lambda (= item) lst)))
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)


(define (no-repeats s)
    (if (null? s) nil
        (cons (car s)
            (no-repeats (filter-lst (lambda (x) (not (= x (car s)))) (cdr s)))
        )
    )
)

(display (no-repeats (list 5 4 5 4 2 2))) ; Output: (5 4 2)






(define (substitute s old new)
  'YOUR-CODE-HERE
    (cond 
        ((null? s)  nil)
        ((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
        ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
        (else (cons (car s) (substitute (cdr s) old new)))
    )
)


(define (sub-all s olds news)
    (if (null? olds) s
        (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))
    )
)



