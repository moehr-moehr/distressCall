;pause map tiles for area 1 and lair 1
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mt0, mt0, mt0, mt1, mt1, mt1, mt3, mt2, mt0, mt0, mt2, mtX, mtX, mtX
	db mtX, mtX, mt3, mt1, mt1, mt1, mt0, mt0, mt2, mt2, mtX, mtX, mtX, mt2, mt0, mt0, mt1, mt1, mtX, mtX
	db mtX, mtH, mt3, mtX, mtX, mtX, mtX, mtX, mtX, mt2, mt1, mt1, mt1, mt2, mtX, mtX, mtX, mt2, mtH, mtX
	db mtX, mtX, mt3, mtX, mtX, mtX, mt3, mt1, mt1, mt2, mtX, mtX, mtX, mt2, mt1, mt1, mt1, mt2, mtX, mtX
	db mtX, mtX, mt3, mt2, mt2, mt2, mt2, mt2, mt3, mtX, mt1, mt3, mt3, mt2, mt3, mt3, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt1, mt3, mt2, mt2, mt2, mt1, mt1, mt3, mt3, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mt2, mt3, mt3, mt3, mt1, mt2, mt3, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt3, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt3, mt2, mt2, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt2, mt3, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
;samus map sprite list
	;save and refill
	db autoVal, $00, $30, $78, mtR, $00 ;repositioned to entrance of biodome, energy refill, entrance is from right instead of left
	db autoVal, $00, $40, $68, mtS, $00 ;save
	db autoVal, $00, $48, $38, mtR, $00 ;refill on skyway
	db autoVal, $00, $60, $38, mtR, $00 ;refill1 in lair 1
	db autoVal, $00, $80, $50, mtR, $00 ;save in lair 1
	db autoVal, $00, $88, $40, mtS, $00 ;refill2 in lair 1
	;items
	db validateBankD, $3E, $60, $58, mtI, $00 ;ice
	db validateBankD, $22, $60, $70, mtI, $00 ;etank
	db validateBankD, $23, $58, $38, mtI, $00 ;bomb
	db validateBankB, $A0, $48, $90, mtI, $00 ;spider
	;missiles
	db validateBankB, $A7, $68, $40, mtM, $00 ;lair missile
	db validateBankD, $21, $40, $58, mtM, $00 ;center top
	db validateBankD, $25, $40, $58, mtM, $00 ;center top
	db validateBankD, $36, $50, $58, mtM, $00 ;met missile
	db validateBankD, $20, $58, $48, mtM, $00 ;bomb missile
	db validateBankD, $27, $58, $78, mtM, $00 ;entry missile
	db validateBankD, $26, $60, $68, mtM, $00 ;ice missile
	;metroids
	db validateBankE, $6A, $18, $70, mtT, $00	;outside right metroid
	db validateBankD, $24, $18, $78, mtT, $00	;inside central metroid
	db validateBankD, $2B, $18, $80, mtT, $00	;inside bomb metroid
	db validateBankB, $A2, $18, $88, mtT, $00	;lair right metroid
	db validateBankB, $A3, $18, $90, mtT, $00	;lair left metroid
	db validateBankB, $A4, $18, $98, mtT, $00	;lair hub metroid
	db validateBankB, $A5, $18, $A0, mtT, $00	;lair depths metroid
	db endList

;;;sniffle, wave and ice, do we got two free ID's?
;28 -gad
;2a -gad
;2e -gad
;31 -gad
;33 -gad
;34 -gad
;39 
;3a  
;3b 
;3c 
;3d 
;3e -ice
;3f -wave
;grotoo
;29
;2c
;2d
;2f
;30
;32
;35
;37
;38
;factry
;20
;21
;22
;23
;24
;25
;26
;27
;2b
;36