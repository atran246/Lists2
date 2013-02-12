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

; Number -> number
; compute the celsius temperature for a given fahrenheit temperature
(check-expect (convertFC 5) -15)
(define (convertFC n) 
  (* (- n 32) (/ 5 9)))

; List-of-Ftemperatures -> List-of-Ctemperatures
; convert a list of fahrenheit temperatures to a list of celsius temperatures
(check-expect (convertFC* (list 5 41)) (list -15 5))
(define (convertFC* lot) 
  (cond
    [(empty? lot) empty ]
    [(cons? lot) (cons 
                  (convertFC (first lot)) (convertFC* (rest lot)))]))
