
org 100h	; Startpunkt Programm in Speicher

; PRAKTIKUM 4: Vorbereitungsaufgabe 3
; Erklären Sie die Funktion folgender Anweisung und Befehle:

null: equ 3fh			
stelle1: equ 92h

	  mov cx,[var16]      ; Was wird jeweils geladen?
	  mov bx,var8      
	  mov al,[bx]
	  mov [var8],al
	  mov dx,stelle1
	  mov al,null
	  out dx,al
	  or byte [0120h],00000011b ; byte: Warum? Effekt?
	  move world [0200h],1      ; word: Warum? Effekt?
	  
var8: db 0
var16: dw 1
