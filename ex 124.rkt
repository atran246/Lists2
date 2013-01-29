;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ex 124|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Andrew Tran Ex 124

; A NEList-of-temperatures is one of: 
; – (cons CTemperature empty)
; – (cons CTemperature NEList-of-temperatures)
; interp.: non-empty lists of measured temperatures 


; NEList-of-temperatures -> Number
; compute the average temperature 
(define (average anelot) 0)

; NEList-of-temperatures -> Number
; compute the sum of the given temperatures 
(define (sum anelot) 0)

; NEList-of-temperatures -> Number
; determine how many numbers are in a list of temperatures
(define (how-many anelot) 0)