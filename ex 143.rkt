;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |ex 143|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Andrew Tran Ex 143


(define-struct work (info rate hours))
; Work is a structure: (make-work Info Number Number). 
; interp. (make-work s r h) combines the info (s) 
; with the pay rate (r) and the number of hours (h) worked.

(define-struct check (name id amount))
; check is a structure: (make-work String Number Number). 
; interp. (make-work n i a) combines the name (n) 
; with the id of the person (i) with the amount paid to that person (a).

(define-struct info (name id))
; info is a structure: (make-info String Number). 
; interp. (make-info n i) combines the name (n) 
; with the id of that person (i).

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
(check-expect (wage* (cons (make-work (make-info "Robby" 12345) 11.95 39) empty))
              (cons (* 11.95 39) empty))

(define (wage* low) 
  (cond
    [(empty? low) empty]
    [(cons? low) (cons (wage (first low))  
                       (wage*(rest low)))]))

; Work -> number
; compute the wage for the given work record 
(check-expect (wage (make-work (make-info "Robby" 12345) 11.95 39))
              (* 11.95 39) )
(define (wage w) 
  (* (work-rate w) (work-hours w)))


; Low -> Loc
; take a list of works and produce a list of checks
(check-expect (wage*.v4 (cons (make-work (make-info "Robby" 12345) 11.95 39) empty))
              (cons (make-check "Robby" 12345 (* 11.95 39)) empty))
(define (wage*.v4 low) 
  (cond
    [(empty? low) empty]
    [(cons? low) (cons (wage.v4 (first low))
                       (wage*.v4 (rest low)))]))

; Work -> Check
; to take a work and produce a check
(check-expect (wage.v4 (make-work (make-info "Robby" 12345) 11.95 39))
              (make-check "Robby" 12345 (* 11.95 39))) 
(define (wage.v4 w) 
  (make-check (info-name (work-info w)) (info-id (work-info w)) (wage w)))
