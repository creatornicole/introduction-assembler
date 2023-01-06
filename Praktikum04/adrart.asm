
        ORG 100H
;----------------------------------------

; PRAKTIKUM 4:
; Adressierungsarten

; Kommentieren (Beschreiben) Sie folgende Befehle bzw.
; Programmablaeufe!
; Welche konkreten Zahlenwerte werden gelesen bzw.
; geschrieben?
; Was ist der Unterschied zwischen EQU und DB?
; Wie zeigen sich die so definierten Werte im fertigen
; Maschinencode ?

; EQU
; ein Symbol wird definiert, d.h. anstelle des Wertes kann man nun den definierten Ausdruck/Namen verwenden
; Name = Wert
; Art Konstantenzuweisung

; DB
; angegebene Groesse an Speicherplatz wird reserviert, d.h. ueber Namen laesst sich auf diesen zugreifen
; Name = Adresse
; Art Variablenzuweisung

scha:	equ 0		;Adresse Schalter
leds:	equ 0		;Adresse LEDs
anz0:	equ 90h		;Adresse rechte 7-Segm-Anzeige
anz1:   equ 92h

start:
		;Durch welchen Zahlenwert wird beim Uebersetzen der 
		;Variablenname ersetzt?
		mov al,[vari8a]       ; Variablenname wird durch Adresse des reservierten Speicherplatzes ersetzt, [vari8a] = 55h
		not al                ; AL = 1010 1010 = 0xaah
		mov [vari8a],al       ; [vari8a] = 0xaah


		;Warum muss dem Uebersetzer in den folgenden Befehlen die
		;Groesse des Operanden extra mitgeteilt werden?
		mov byte [vari8b],88h ; damit dieser weiss, wie weit Wert geht (?)
		inc word [vari16]
	
		mov bx,textanf        ; kopiere Adresse der Variable textanf in Register BX
		mov cl,[bx]           ; greife auf Speicherzelle mit Adressenwert aus BX zu
		                      ; kopiere Wert dieser Speicherzelle in Register CL
		mov ch,[bx+3]         ; greife auf Speicherzelle mit Adressewert aus BX + 3 zu
		                      ; kopiere Wert dieser Speicherzelle in Register CH
		mov dl,[textend]      ; kopiere Wert 0ffh in Register DL

        mov al,01000000b      ; kopiere angegebenen binaeren Wert in Register AL
        mov dx,anz0           ; kopiere Wert 90h in Register DX (fuer Displayanzeige Segment ganz rechts)
        out dx,al             ; im Display anzeigen
        inc dx                ; DX = 91H
        inc dx                ; DX = 92H
		out dx,al             ; naechste Stelle (eine Stelle weiter links)
		inc dx                ; DX = 93H
        inc dx                ; DX = 94H
		out dx,al             ; naechste Stelle (eine Stelle weiter links)

		mov cx,4              ; CX = 4
		mov si,0              ; SI = 0
schl:	mov bx,codetab        ; Adresse des ersten Wertes des Arrays codetab wird in BX kopiert
		mov al,[bx+si]        ; BX = Adresse des ersten Wertes von codetab, SI = 0 + schleifendurchlauf
		                      ; d.h. Inhalt Speicherzelle mit berechneten Adresswert wird in AL kopiert
		out anz1,al           ; Registerinhalt AL wird an 7-Segment-Anzeige ausgegeben
		inc si                ; SI = SI + 1
		loop schl             ; Schleife
		
		nop                   ; Leerbefehl, drei Takte lang wird nichts gemacht

		jmp start             ; Endlosschleife des Programms

		dd 0
 
vari8a:	db 55h
vari8b:	db 0
vari16:	dw 1234h

textanf: db "ABCabc"
textend: db 0ffh

; codetab ist Array des gewaehlten Datentyps
; Verwendung codetab steht fuer Adresse des ersten Wertes
codetab: 
		db 00000110b	;1
		db 01011011b	;2
		db 01001111b	;3
		db 01100110b	;4

;----------------------------------------

