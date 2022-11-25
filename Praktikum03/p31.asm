
org 100h ; Startpunkt Programm in Speicher

; PRAKTIKUM 3: Aufgabe p31
; Alle LEDs sollen nur dann leuchten, wenn der Schalter S0 eingeschaltet ist.

start:
	in al,0			; Schalterstellung abfragen
	ror al,1		; Registerinhalt AL um eins nach rechts rotieren
					; d.h. wenn Schalter S0 an, dann CF == 1, sonst CF == 0
	jc ledan		; Wenn CF = 1, dann springe zu ledan
	mov al,00		; Wert in AL kopieren
	out 0,al		; alle LEDs ausschalten
	jmp start
	
ledan:
	mov al,0FFh		; Wert in AL kopieren
	out 0,al		; Wert aus AL an LED-Port ausgeben -> alle LEDs an
	
