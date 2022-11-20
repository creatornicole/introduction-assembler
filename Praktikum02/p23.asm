
org 100h ; Startpunkt Programm in Speicher

; PRAKTIKUM 2: Aufgabe p23
; Eine einzelne leuchtende LED soll in der LED-Reihe fortlaufend sichtbar
; von links nach rechts "wandern"

start: MOV AX,10000000b	; Wert in AX kopieren (Ausgabe LED 7)
ausgabe: 
	   OUT 0,AX		; Wert aus AX an LED-Ports ausgeben
	   CALL warte	; Aufrufen Warte-Unterprogramm
	   RCR AX,1		; Registerinhalt einmal nach links rotieren
					; (um naechste LED im naechsten Schritt auszugeben)
	   jc start		; wenn CF=1 dann zu start springen (erneuter Start mit LED 7)
	   jmp ausgabe	; sonst zu ausgabe springen und Ausgabe LED rechts daneben(erzeugt Endlosschleife)
	   
warte: XOR CX,CX			; Unterprogramm Wartefunktion
	   schlf: loop schlf
	   RET
