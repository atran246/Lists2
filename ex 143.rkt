;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |ex 143|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Andrew Tran Ex 143


(define-struct work (name rate hours))
; Work is a structure: (make-work String Number Number). 
; interp. (make-work s r h) combines the name (n) 
; with the pay rate (r) and the number of hours (h) worked.

(define-struct check (name amount))
; Work is a structure: (make-work String Number). 
; interp. (make-work n a) combines the name (n) 
; with the amount paid to that person (a).

; Low (list of works) is one of: 
; – empty
; – (cons Work Low)
; interp. an instance of Low represents the work efforts
; of some hourly employees

; Loc (list of checks) is one of: 
; – empty
; – (cons Check Loc)
; interp. a Loc as a list of paychecks 

; Low -> List-of-numbers
; compute the weekly wages for all given weekly work records 
(check-expect (wage* (cons (make-work "Robby" 11.95 39) empty))
              (cons (* 11.95 39) empty))

(define (wage* low) 
  (cond
    [(empty? low) empty]
    [(cons? low) (cons (wage (first low))  
                       (wage*(rest low)))]))

; Work -> number
; compute the wage for the given work record 
(check-expect (wage (make-work "Robby" 11.95 39))
              (* 11.95 39) )
(define (wage w) 
  (* (work-rate w) (work-hours w)))


; Low -> Loc
; take a list of works and produce a list of checks
(check-expect (wage*.v3 (cons (make-work "Robby" 11.95 39) empty))
              (cons (make-check "Robby" (* 11.95 39)) empty))
(define (wage*.v3 low) 
  (cond
    [(empty? low) empty]
    [(cons? low) (cons (wage.v3 (first low))
                       (wage*.v3 (rest low)))]))

; Work -> Check
; to take a work and produce a check
(check-expect (wage.v3 (make-work "Robby" 11.95 39))
              (make-check "Robby" (* 11.95 39)))
(define (wage.v3 w) 
  (make-check (work-name w) (wage w)))
