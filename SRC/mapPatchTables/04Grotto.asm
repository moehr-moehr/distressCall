;pause map tiles for area 2 ruins
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mt1, mt1, mt0, mt0, mt0, mt0, mt0, mt0, mt0, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mt0, mt0, mt0, mt0, mt0, mt3, mt1, mt1, mt0, mt0, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mt1, mt0, mt0, mt0, mt0, mt0, mt2, mt2, mt3, mt0, mt0, mt0, mt0, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mt1, mt0, mt0, mt0, mt2, mt3, mt3, mt1, mt3, mt0, mt0, mt0, mt0, mtX, mtX, mtX, mtX, mtX
	db mtX, mtH, mt1, mt0, mt0, mt0, mt1, mt1, mt1, mt2, mt1, mt1, mt1, mt0, mt0, mt1, mt1, mt1, mtH, mtX
	db mtX, mtX, mt1, mt0, mt0, mt0, mt3, mt0, mt3, mt3, mt3, mt3, mt2, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mt1, mt2, mt2, mt2, mt3, mt2, mt2, mt2, mtX, mtX, mt2, mt1, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mt1, mt1, mt1, mt3, mt1, mt3, mt3, mt1, mt2, mt1, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mt1, mt1, mt1, mt2, mt1, mt2, mt2, mt2, mt3, mt1, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mt2, mt3, mt3, mt2, mt3, mt3, mt3, mt3, mt2, mt2, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
;samus map sprite list
	;save and refill
	db autoVal, $00, $40, $38, mtR, $00 ;bank 9 exterior refill
	db autoVal, $00, $40, $50, mtS, $00
	db autoVal, $00, $58, $50, mtS, $00
	db autoVal, $00, $70, $60, mtS, $00
	db autoVal, $00, $78, $60, mtR, $00	;bank D interior refill
	db autoVal, $00, $58, $60, mtR, $00
	;items
	db validateBankD, $3F, $60, $40, mtI, $00	;wave
	db validateBankD, $30, $40, $48, mtI, $00	;varia
	db validateBankD, $29, $50, $38, mtI, $00	;grav
	db validateBankD, $35, $78, $68, mtI, $00	;hijump
	db validateBankE, $64, $78, $40, mtI, $00	;etank in lair2
	;missiles
	db validateBank9, $3E, $60, $20, mtM, $00	;swamp missile
	db validateBank9, $3F, $50, $60, mtM, $00	;train missile
	db validateBankD, $2C, $48, $58, mtM, $00	;pipe missile
	db validateBankD, $2D, $68, $50, mtM, $00	;water missile
	db validateBankD, $32, $70, $50, mtM, $00	;secret tubes missile
	db validateBankE, $65, $68, $30, mtM, $00	;lair 2 entry missile
	;metroids
	db validateBankD, $37, $18, $A8, mtT, $00	;left outside metroid
	db validateBankD, $38, $18, $A8, mtT, $00	;tower metroid
	db validateBankD, $2F, $18, $A8, mtT, $00	;hydro metroid
	db validateBankE, $60, $18, $A8, mtT, $00	;geo top metroid
	db validateBankE, $61, $18, $A8, mtT, $00	;geo left metroid
	db validateBankE, $63, $18, $A8, mtT, $00	;geo right metroid
	db endList
