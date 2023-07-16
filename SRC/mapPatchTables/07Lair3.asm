;pause map tiles for lair3
	db mtX, mtX, mtX, mtX, mtX, mtX, mt2, mt2, mt3, mt0, mt0, mt3, mt2, mt2, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mt3, mt1, mt1, mt1, mt1, mt0, mt0, mt1, mt1, mt1, mt1, mt3, mtX, mtX, mtX, mtX
	db mtX, mtH, mt2, mt2, mt3, mt2, mt3, mt2, mt2, mt0, mt0, mt3, mt3, mt2, mt2, mt3, mt2, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mt3, mtX, mt3, mt1, mt1, mt0, mt0, mt1, mt1, mt1, mtX, mt3, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mt3, mtX, mtX, mt2, mt2, mt0, mt0, mt2, mt2, mtX, mtX, mt3, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mt2, mt3, mtX, mt3, mt3, mtX, mt0, mt0, mtX, mt3, mt3, mtX, mt3, mt2, mt2, mtH, mtX
	db mtX, mtX, mtX, mtX, mt3, mt2, mt3, mt3, mtX, mtX, mtX, mtX, mt3, mt3, mt2, mt3, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mt2, mt3, mt3, mt2, mtX, mtX, mt2, mt3, mt3, mt2, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mt3, mt3, mt2, mt3, mt3, mt2, mt3, mt3, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mt3, mt3, mtX, mt3, mt3, mtX, mt3, mt3, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mt3, mt3, mtX, mt3, mt3, mtX, mt3, mt3, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mt3, mt3, mtX, mt3, mt3, mtX, mt3, mt3, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt2, mt2, mt3, mt3, mt2, mt2, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt3, mt3, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt2, mt2, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
;samus mt sprite list
	;save and refill
	db autoVal, $00, $20, $60, mtS, $00
	db autoVal, $00, $38, $60, mtR, $00
	db autoVal, $00, $60, $48, mtR, $00
	db autoVal, $00, $80, $60, mtS, $00	
	;items
	db validateBankC, $F4, $48, $20, mtI, $00	;spazer
	db validateBankC, $F5, $30, $88, mtI, $00	;plasma
	db validateBankE, $66, $20, $48, mtI, $00	;space jump
	db validateBankE, $67, $40, $68, mtI, $00	;dash boots
	db validateBankA, $7D, $80, $48, mtI, $00	;springball
	db validateBankC, $F7, $48, $50, mtI, $00	;etank
	db validateBankA, $7E, $60, $68, mtM, $00   ;etank
	;missiles
	db validateBankE, $68, $30, $78, mtM, $00   ;missile! new!
	db validateBankE, $69, $28, $30, mtM, $00   ;missile! new!
	db validateBankA, $7C, $68, $38, mtI, $00	;missile! new!
	db validateBankA, $79, $78, $58, mtM, $00   ;newer! missile in central engineering
	;metroids
	db validateBankA, $7B, $18, $78, mtT, $00	;engineering depths metroid
	db validateBankF, $BE, $18, $80, mtT, $00	;engineering depths metroid
	db validateBankE, $6B, $18, $88, mtT, $00	;engineering depths metroid
	db validateBankE, $6C, $18, $90, mtT, $00	;engineering depths metroid
	db validateBankE, $6D, $18, $98, mtT, $00	;engineering depths metroid
	db validateBankE, $6E, $18, $A0, mtT, $00	;engineering depths metroid
	db endList

;bank C IDs: 
;74 - spaz
;75 plaz
;76 - first etank
;77 - top center engineering etank
;78 gadora
;79 - zeb
;7a zeb
;7b gadora
;7c - zeb
;7d - zeb
;7e - zeb
;7f zeb

