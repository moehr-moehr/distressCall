;pause map tiles for landing site and 1st cave
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mt0, mt0, mt0, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mt0, mt0, mt0, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mt0, mt0, mt0, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mt0, mt0, mt0, mt1, mt1, mt1, mt1, mt1, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt2, mt2, mt2, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt1, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt1, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt1, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt2, mt1, mt1, mt2, mt2, mt2, mt2, mt1, mt1, mt1, mtH, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt2, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mt2, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtH, mt2, mt2, mt1, mt1, mt1, mt1, mt2, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
	db mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX, mtX
;samus map sprite list
	db autoVal, $00, $28, $24, mtG, flipL
	db autoVal, $00, $28, $2C, mtG, flipR
	db autoVal, $00, $68, $70, mtS, $00 
	db autoVal, $00, $80, $18, mtR, $00 
	;items
	db validateBankC, $F6, $58, $68, mtI, $00 ;etank
	db validateBankF, $BD, $48, $60, mtM, $00 ;mtank, first / last
	;metroids
	db validateBankA, $7F, $18, $A8, mtT, $00 ;endgame final metroid
	db validateBankF, $BF, $18, $A8, mtT, $00 ;startgame first metroid
	db endList
