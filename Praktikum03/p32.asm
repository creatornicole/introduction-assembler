

org 100h	; Startpunkt Programm in Speicher

; PRAKTIKUM 3: Aufgabe p32
; Auf der LED-Reihe soll eine einzelne LED fortlaufend hin und her "wandern".

	mov al,1
	out 0,al		; LED0 anschalten

rotateLeft:
	rol al,1		; rotiere Registerinhalt um eins nach links
					; Ziel: naechste LED anschalten, vorherige ausschalten
	call warte
	out 0,al
	test al,128		; Maske erzeugen
	jz rotateLeft	; wenn LED7 nicht an, weiter nach links shiften
					; sonst Rotierrichtung aendern
rotateRight:
	ror al,1		; rotiere Registerinhalt um eins nach rechts
	call warte
	out 0,al
	test al,1		; Maske erzeugen
	jz rotateRight
	jmp rotateLeft	
	
warte:				; Implementation einfacher Wartefunktion
	xor cx,cx
	schlf:
		loop schlf
	ret
