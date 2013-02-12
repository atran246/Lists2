;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |ex 140|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Andrew Tran ex 140

; A List-of-Ftemperatures is one of:
; - empty
; - (cons FTemperature List-of-temperatures)
; interp.: a list of Fahrenheit temperatures

; A List-of-Ctemperatures is one of:
; - empty
; - (cons Temperature List-of-temperatures)
; interp.: a list of Celsius temperatures


; List-of-Ftemperatures -> List-of-Ctemperatures
; convert a list of fahrenheit temperatures to a list of celsius temperatures
(check-expect (convertFC (list 5 41)) (list -15 5))
(define (convertFC lot) 
  (cond
    [(empty? (rest lot)) ... ]
    [(cons? lot) ...  (first lot)... (convertFC (rest lot))...]))