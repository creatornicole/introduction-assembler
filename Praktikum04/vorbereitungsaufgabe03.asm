
org 100h	; Startpunkt Programm in Speicher

; PRAKTIKUM 4: Vorbereitungsaufgabe 3
; Erklären Sie die Funktion folgender Anweisung und Befehle:

null: equ 3fh			  ; sind Symboldefinitionen		
stelle1: equ 92h		  ; weisen Ausdruck Namen zu (wie Konstantendefinition)

						  ; Was wird jeweils geladen?
	  mov cx,[var16]      ; (Direkte Adressierung) Laedt Operanden aus reservierten Speicherplatz var16
						  ; hier: 1
	  mov bx,var8         ; (Unmittelbare Adressierung) Laedt Adresse des reservierten Speicherplatzes var8
						  ; hier: 120h
	  mov al,[bx]	      ; (Indirekte Adressierung) Laedt Operanden der Adresse, die unter BX steht
	  mov [var8],al		  ; (Direkte Adressierung) Kopiert Eintrag aus AL an reservierten Speicherplatz var8
	  mov dx,stelle1	  ; (Unmittelbare Adressierung) Kopiert 92h in DX
	  mov al,null		  ; (Unmittelbare Adressierung) Kopiert 3fh in AL
	  out dx,al			  ; (Registeradressierung) Gibt Operand von AL an Port, der in DX steht, aus
	  
	  or byte [0120h],00000011b ; byte: Warum? Effekt?
								; byte gibt Aussage ueber Datentyp
	  move word [0200h],1      ; word: Warum? Effekt?
								; word gibt Aussage ueber Datentyp
	  
var8: db 0				  ; sind Datendefinitionen
var16: dw 1				  ; reservieren Speicherplatz in Speicher
						  ; ueber Namen auf diesen zugreifen (wie Variablenvereinbarung)
