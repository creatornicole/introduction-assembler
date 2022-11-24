
	  ORG 100H
;----------------------------------------

; PRAKTIKUM 3:
; Flags und bedingte Spruenge

start:
; Sagen Sie voraus, welche Flags (CF-ZF-PF-SF) und wie durch die
; entsprechenden Befehle beeinflusst werden, Ueberpruefen Sie

          mov  ax,0281h
          cmp  al,0c0h
          test al,7eh
          or   al,18h
          and  al,0fh
          rol  ah,1
          rol  ah,1

eingc:    in   al,0    ; Schalter abfragen
          cmp  al,9
          jc  eingc    ; bei welchen Eingabewerten wird gesprungen ?
					   ; bei Eingabewerten, die Carry ausloesen
					   ; sind all die Eingabewerte, die Bit 3-7 == 0
					   ; d.h. gesprungen wird, wenn Button 3-7 aus sind
					   ; Button 0-2 beliebig

eingt:    in   al,0    ; Schalter abfragen
          test al,81h
          jnz  eingt   ; bei welchen Eingabewerten wird gesprungen ?
					   ; bei Eingabewerten, die nicht 0 ergeben
					   ; sind all die Eingabewerte, bei denen (Bit7 == 1) | (Bit0 == 1)
					   ; d.h. Schalter ganz rechts und/oder Schalter ganz links muessen an sein
					    
          nop		   ; Leerbefehl, drei Takte lang wird nichts getan
          jmp start

;----------------------------------------
