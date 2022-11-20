
org 100h ; Startpunkt Programm in Speicher

; PRAKTIKUM 2: Aufgabe p22
; Auf der LED-Reihe soll abwechselnd sichtbar zwischen den LEDs
; 6-4-2-0 und 7-5-3-1 umgeschaltet werden

start: MOV AX, 01010101b	; Wert in AX kopieren
	   OUT 0,AX				; Wert in AX an LEDs ausgeben (hier: LEDs 6-4-2-0)
	   CALL warte			; Aufruf Unterprogramm
	   NOT AX				; Wert in AX invertieren
	   OUT 0,AX				; Wert in AX an LEDs ausgeben (hier: LEDs 7-5-3-1)
	   CALL warte
	   jmp start
	   
warte: XOR CX,CX			; Warte-Unterprogramm
	   schl: loop schl
	   RET
