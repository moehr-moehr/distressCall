	dw $047A     ; Samus' Y position
	dw $0670     ; Samus' X position
	dw $04B0     ; Screen Y position
	dw $0670     ; Screen X position
	
    ; No bank for enemy graphics
	dw gfx_surfaceSPR      ; Enemy tiles source address
	db BANK(gfx_surfaceBG) ; Background tiles source bank
	dw gfx_surfaceBG       ; Background tiles source address
    ; No bank for metatiles
	dw metatiles_surface   ; Metatile definitions source address
    ; No bank for collision
	dw collision_surface   ; Collision data source address
	db $0F       ; Bank for current room
	
	db $59       ; Samus solid block threshold
	db $59       ; Enemy solid block threshold
	db $59       ; Projectile solid block threshold
	
	db $00       ; Samus' equipment
	db $00       ; Samus' beam
	db $00       ; Samus' energy tanks
	dw $0099     ; Samus' health
	dw $0030     ; Samus' max missiles
	dw $0030     ; Samus' missiles
	
	db $01       ; Direction Samus is facing
	db $01       ; Acid damage
	db $04       ; Spike damage
	db $21       ; Real number of Metroids remaining
	db $05       ; Song for room
	db $00       ; In-game timer, minutes
	db $00       ; In-game timer, hours
	db $21       ; Number of Metroids remaining
	
	;;;;m2maps: map patch additional SRAM to track total items collected
	db start_items		 ;starting 'equipment found' count
	db total_items       ;totalItemsToCollect
	db $00               ;gravity suit obtained
	;;;;end m2maps block
