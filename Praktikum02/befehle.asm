	ORG 100H

;----------------------------------------

; PRAKTIKUM 2:
; Grundlegende Befehle

start:
		mov al,01010101b	; kopiere Konstante in Ziel-Register
		mov ah,0aah
		mov cx,ax			; kopiere Inhalt aus Quell-Register in Ziel-Register

		mov [0150h],al		; kopiere Inhalt aus Quell-Register in Adresse
		mov [0152h],cx

		add ch,cl			; addiere Inhalt von beiden Registern
							; ueberschreibe Ziel-Register mit Ergebnis

		mov bx,2
		dec bx				; Inhalt des Registers wird um eins erniedrigt
		dec bx
		dec bx

		mov dx,7700h
		not bh				; Registerinhalt wird bitweise invertiert
		or  dl,bl			; Registerinhalte werden bitweise ODER-verknuepft
							; Ziel-Register wird mit Ergebnis ueberschrieben
		and dh,11001100b	; Registerinhalte werden bitweise UND-verknuepft
							; Ziel-Register wird mit Ergebnis ueberschrieben
							
		mov al,00000110b
		mov cx,3
schl:	rol al,1			; schl: ... Schleifenbeginn
							; Registerinhalt wird einmal nach links rotiert
		out 0,al			; Ausgabe/Ansteuerung LED
		loop schl			; Registerinhalt von CX wird dekrementiert
							; zu <shortlabel> springen solange CX != 0
       
		mov bl,00000110b
		mov cl,3
		shr bl,cl			; Registerinhalt wird Inhalt-Des-Registers-CL-mal nach rechts geschoben
		
		mov al,-1
		out 90h,al			; Ansteuerung 7-Segment-Anzeige je nach Registerinhalt AL
		not al				
		out 92h,al			
		out 94h,al			
       
		jmp start			; springen zu start (erzeugt Endlosschleife)


;----------------------------------------
