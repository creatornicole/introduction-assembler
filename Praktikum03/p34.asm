
org 100h		; Startadresse Programm in Speicher

; PRAKTIKUM 3: Aufgabe p34
; Auf den Stellen 3 und 4 der 7-Segment-Anzeige soll der Zustand
; der Schalter S3 und S4 (jeweils "0" oder "1") angzeigt werden.

; PUSH und POP!!!

	int 6
start:
	in al,0			; Schalter einlesen
	
	test al,1000b	
	jnz schalteEins	
	jz schalteNull
	
schalteEins:
	mov al,110b
	out 96h,al
	jmp start

schalteNull:
	mov al,0011_1111b
	out 96h,al
	jmp start
	
	
