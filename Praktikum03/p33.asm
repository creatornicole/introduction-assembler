
org 100h	; Startpunkt Programm in Speicher

; PRAKTIKUM 3: Aufgabe p33
; Alle LEDs sollen sichtbar blinken, wenn der Schalter S0 eingeschaltet ist.
; Der Schalter S7 soll zusaetzlich die Blinkfrequenz (schnell und langsam)

; Bedingungen:
; - fuer die Auswertung beider Schalter soll nur einmal eingelesen werden
; - das Programm soll unabhaengig von der Stellung der anderen Schalter funktionieren
; - entwerfen Sie zu Beginn einen Programmablaufplan und setzen Sie diesen um

start:
	in al,0			; Schalter einlesen
	test al,1		
	jnz blink		; wenn Schalter S0 an, blink
	jmp start
	
blink:				; laesst LEDs blinken
	test al,128		
	jnz blinkSchnell; wenn Schalter S7 an, dann blinke schnell
	mov al,0ffh
	out 0,al		; alle LEDs an
	call warteLang	; laenger warten
	mov al,0
	out 0,al		; alle LEDs aus
	call warteLang	; laenger warten
	jmp start
	
blinkSchnell:		; laesst LEDs schneller blinken
	mov al,0ffh
	out 0,al		; alle LEDs an
	call warteKurz	; kurz warten
	mov al,0
	out 0,al		; alle LEDs aus
	call warteKurz	; kurz warten
	jmp start
	
warteKurz:			; Implementation einfacher Wartefunktion
	xor cx,cx
	schlf:
		loop schlf
	ret
	
warteLang:			; Implementation einfacher laengerer Wartefunktion
	call warteKurz 
	call warteKurz
	ret
	
