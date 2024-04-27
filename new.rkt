#lang racket
(provide (all-defined-out))
(define s "hello"); like a val binding in ml 
(define x 3)
(define y (+ x 2)) ; the + is a function and the result is bound to y
(define yi
  (lambda (x)
    (* x x x)))
(define g (yi 20))
(define (fact n)
  (cond [(= n 0) 1]
        [(* n (fact (- n 1)))]))


; sum of numbers, used the cond operator thing, acts like an "if, else, tjen"
; kind of thing 

(define (sum-list listy)
  (cond [(null? listy) 0]
        [else (+ (car listy) (sum-list (cdr listy)))]))


;; thunking examply (delaying expression), explained in "thunking explained"
(define (my-thunk)
  (begin
    (display "Computing...")
    (newline)
    (+ 5 3)))

;; Using the thunk
(display "Before calling thunk")
(newline)
(define result (my-thunk))  ; Computation happens when the thunk is called
(display "After calling thunk: ")
(display result)
(newline)

; recursive function to sum in a list, else is not necessary
; also calling lists like '(1 2 3) (no commas) 

(define (sum_list lst)
  (if (null? lst)
      0
      (+ (car lst)
         (sum_list (cdr lst))
         )))

;factorial function base case 1

(define (factorial num)
  (if (= num 0)
      1
      (* num (factorial (- num 1)))))

; this function checks if the digit is even, and if it is then it doubles
; the value and appends it to the list, the base case being when the list
; has been emptied
; the cond operator is very helpful, syntactic sugar as they say 

(define (even_double lst)
  (cond [(null? lst) '()]
        [(even? (car lst)) (cons(* 2 (car lst)) (even_double(cdr lst)))]
        [else (even_double(cdr lst))]))
    

