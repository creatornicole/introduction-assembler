
org 100h ; Startpunkt Programm in Speicher

; PRAKTIKUM 2: Aufgabe p24
; Loeschen Sie die gesamte 7-Segment-Anzeige. Danach soll auf einer Stelle
; dieser Anzeige sichtbar abwechselnd eine "0" und eine "1" angezeigt werden.

INT 6 				; Software-Interrupt Routine des Systemprogramms des SBC
					; bewirkt Loeschen des gesamten Displays
ausgabe: MOV AX,00111111b 	; Einlesen Wert um 0 auf Displaystelle auszugeben
		OUT 90h,AX			; Ausgabe dieser 0 an Port 90h
		CALL warte 			; Aufruf Warte-Unterprogramm
		MOV AX,00000110b 	; Einlesen Wert um 1 auf Displaystelle auszugeben
		OUT 90h,AX			; Ausgabe dieser 1 an Port 90h
		CALL warte
		jmp ausgabe			; springe zu ausgabe (erzeugt Endlosschleife)


warte: XOR BX,BX	; Unterprogramm Wartefunktion
	   schlf: loop schlf
	   RET
