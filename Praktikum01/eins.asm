
; Mein erster Versuch

	org 100h

start:
	in al,0		; Einlesen Schalterstellung
	out 0,al 	; auf LED-Zeile ausgeben
	mov cx, -1  ; Zaehler fuer Zeitschleife laden
schl1:
	loop schl1	; loop: zwei Befehle in einem
				; Schritt 1: Dekrementiere <CX>
				; Schritt 2: Sprung, wenn <CX> ungleich 0
	mov al,0
	out 00,al	; alle LED "ausschalten"
	mov cx,-1
schl2:
	loop schl2
	jmp start	; Endlosschleife
	
	
