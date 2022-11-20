
org 100h

; PRAKTIKUM 2: Aufgabe p21
; Auf der LED-Reihe sollen drei nebeneinanderliegende LED sichtbar blinken.

start: MOV AL,0111b  ; kopiere Werte in AL (drei nebeneinanderliegende sollen leuchten)
	   OUT 0,AL   	 ; gebe Inhalt von AL an LEDs aus
	   CALL warte 	 ; Aufruf Unterprogramm warte
	   MOV AL,0	  	 ; passe Wert in AL an (alle LEDs wieder aus)
	   OUT 0,AL   	 ; gebe Inhalt von AL an LEDs aus
	   CALL warte
	   jmp start  	 ; fange von vorn an
	   
warte: XOR CX,CX
	   schlf: loop schlf
	   RET		  	 ; zu Hauptprogramm zurueckkehren
