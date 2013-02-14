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


