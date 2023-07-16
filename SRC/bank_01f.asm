SECTION "ROM Bank $010", ROMX[$4000], BANK[$10]

;map table for loading proper submap and samus' map position XY offset for relevant bank map library
bank_09_maps:
	INCLUDE "mapPatchTables/mapTables00.asm"
bank_0A_maps:
	INCLUDE "mapPatchTables/mapTables01.asm"
bank_0B_maps:
	INCLUDE "mapPatchTables/mapTables02.asm"
bank_0C_maps:
	INCLUDE "mapPatchTables/mapTables03.asm"
bank_0D_maps:
	INCLUDE "mapPatchTables/mapTables04.asm"
bank_0E_maps:
	INCLUDE "mapPatchTables/mapTables05.asm"
bank_0F_maps:
	INCLUDE "mapPatchTables/mapTables06.asm"

;the actual map tiles to load to Window VRAM
landing:
	INCLUDE "mapPatchTables/00Landing.asm"
fissure:
	INCLUDE "mapPatchTables/01Fissure.asm"
temple:
	INCLUDE "mapPatchTables/02Temple.asm"
lair1:
	INCLUDE "mapPatchTables/03Lair1.asm"
grotto:
	INCLUDE "mapPatchTables/04Grotto.asm"
lair2:
	INCLUDE "mapPatchTables/05Lair2.asm"
tomb:
	INCLUDE "mapPatchTables/06Tomb.asm"
lair3:
	INCLUDE "mapPatchTables/07Lair3.asm"
chasm:
	INCLUDE "mapPatchTables/08chasm.asm"
tower:
	INCLUDE "mapPatchTables/09Tower.asm"
abyss:
	INCLUDE "mapPatchTables/0aAbyss.asm"
omega:
	INCLUDE "mapPatchTables/0bOmega.asm"
hive:
	INCLUDE "mapPatchTables/0cHive.asm"
escape:
	INCLUDE "mapPatchTables/0dEscape.asm"

mapCollectionSubset:
	dw bank_09_maps, bank_0A_maps, bank_0B_maps, bank_0C_maps, bank_0D_maps, bank_0E_maps, bank_0F_maps

pauseMapTable:
	dw landing
	dw fissure
	dw temple
	dw lair1
	dw grotto
	dw lair2
	dw tomb 
	dw lair3
	dw chasm
	dw tower
	dw abyss
	dw omega
	dw hive
	dw escape

            ; m2maps: load new m2map tilemap to window VRAM during warp screen transition type
;                ld a, [loadNewMapFlag]
;                jr z, .next
				;;corrections from RT-55J:
					;;RT-55J correction: Wait for Vblank as close to tile writing as possible
					; Save interrupt status
;					ldh a, [rIE]
;					ldh [hTemp.b], a
;					res 0, a
;					ldh [rIE], a
					; Wait for VBlank
;					.waitLoop:
;						ldh a, [rLY]
;						cp $91
;					jr nz, .waitLoop
					
					; LCD is disabled --- begin VRAM transfer
;					call m2maps_loadMapTiles
					
					; Restore interrupt status
;					ldh a, [hTemp.b]
;					ldh [rIE], a
					;if done writing map rows, shut off map updater
;				.next:
			; end m2maps block
;ret

;m2maps_farLoadMapTiles:
updateLocatorPosition_farCall:
VBlank_loadPauseMapDuringTransition:
	;if we come in here without the init value, skip the setup
	ld a, [loadNewMapFlag]
	cp set_new_map_flag
	jp nz, .continueDrawing
		; Get screen index from coordinates
		ldh a, [hSamusYScreen]
		rl a
		rl a
		rl a
		rl a
		and $f0
		ld [samusMapY], a
		ldh a, [hSamusXScreen]
		and $0f
		ld [samusMapX], a
			;adjust index val based on direction uuuuuu
			; Right
			ld a, [doorScrollDirection]
			cp a, $01
			jr nz, .left
				ld a, [samusMapX]
				inc a
				and a, $0f
				ld [samusMapX], a
				jr .none
			.left:
			ld a, [doorScrollDirection]
			cp a, $02
			jr nz, .up
				ld a, [samusMapX]
				dec a
				and a, $0f
				ld [samusMapX], a
				jr .none
			.up:
			ld a, [doorScrollDirection]
			cp a, $04
			jr nz, .down
				ld a, [samusMapY]
				sub a, $10
				and a, $f0
				ld [samusMapY], a
				jr .none						
			.down:
			ld a, [doorScrollDirection]
			cp a, $08
			jr nz, .none
				ld a, [samusMapY]
				add a, $10
				and a, $f0
				ld [samusMapY], a
			.none:
				ld a, [samusMapY]
				ld b, a
				ld a, [samusMapX]
				add a, b
				ld [mapCollectionIndex], a
;					;debug hud view
;					ld a, [mapCollectionIndex]
;					ld [samusDispMissilesLow], a
;					ld [samusCurMissilesLow], a
	;set up map index based on currentLevelBank
	ld a, [currentLevelBank]
	sub mapTable_bankOffset
;		;debug hud view
;		ld [samusCurMissilesHigh], a
;		ld [samusDispMissilesHigh], a
	add a, a
	ld e, a
		;debug, and for later
;		ld [mapLevelBankIndexOffset], a
	ld d, $00
	ld hl, mapCollectionSubset
	add hl, de
		;now we have pointer to the proper map collection table to review (indexed by currentLevelBank)
		;load the value at that submap table index to hl to find the proper submap
		ld e, [hl]
		inc hl
		ld d, [hl]
		ld h, d
		ld l, e
		;correct mapCollectionSubset index by bank pointer should be in HL now
		;so now, enter table based on hSamusYScreen/hSamusXScreen
		ld d, $00
		ld a, [mapCollectionIndex]
		ld e, a
		add hl, de
			ld a, l
			ld [mapCollectionTableXY], a
			ld a, h
			ld [mapCollectionTableXY+1], a
				;now we have pointer to the proper map (indexed by mapCollectionIndex)
				;load it and prepare to read data from the map to Window VRAM targets
				ld e, [hl]
				ld d, [hl]
				ld h, d
				ld l, e

	;now load value at HL addr and double it as pointer to submap to read from
	ld a, l
	add a, a
	ld e, a
	ld d, $00
	ld hl, pauseMapTable
	add hl, de	
	;hl now points to map pointer
	;
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, d
	ld l, e
	;
	;;;;;;;;;;; new - update this by loadNewMapFlag's value, by 100 per row, for each row already written.
	ld a, [loadNewMapFlag]
	cp $01
	jr nz, .dontAdjust
		dec a
		ld [loadNewMapFlag], a
		ld de, vramDest_m2maps
		jr .keepGoing
	.continueDrawing:
	.dontAdjust:
		ld a, [pauseMapResumeH]
		ld l, a
		ld a, [pauseMapResumeH+1]
		ld h, a
		ld a, [pauseMapResumeD]
		ld e, a
		ld a, [pauseMapResumeD+1]
		ld d, a
	.keepGoing:

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; should be good - 
    ld b, $20
    .loopMapWrite:
        ld a, [hl+]
        ld [de], a
        inc de
        ld a, [hl+]
        ld [de], a
        inc de
        dec b
		ld a, b
		and $0f
		cp a, $06
		jr nz, .skipBuffer
			ld a, b
			and $f0
			ld b, a
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
			inc de
				;new - track if all 16 rows are written, by inc once per map row loop
				ld a, [loadNewMapFlag]
				inc  a
				ld [loadNewMapFlag], a
		.skipBuffer:
		ld a, b
		cp $00
		jr nz, .loopMapWrite
		;exit if done with 4 rows and row doesn't equal final row
			ld a, [loadNewMapFlag]
			cp $10
			jr z, .dontResume
				ld a, l
				ld [pauseMapResumeH], a
				ld a, h
				ld [pauseMapResumeH+1], a
				ld a, e
				ld [pauseMapResumeD], a
				ld a, d
				ld [pauseMapResumeD+1], a
				ret
		.dontResume:
		ld a, $00
		ld [pauseMapResumeH], a
		ld [pauseMapResumeH + 1], a
		ld [pauseMapResumeD], a
		ld [pauseMapResumeD + 1], a
	;note - hl and de should already be set up from before
	ld d, mapIconsWram_hi
	ld e, mapIconsWram_lo
	.loadMapIconData:
		ld a, [hl+]
        ld [de], a
		inc de
		cp a, endList
		jr z, .next
		jr .loadMapIconData
	.next:
		inc de
		;;;;;;;;;;;; experimental - Samus Locator coords update
			ld a, [mapCollectionTableXY]
			ld l, a
			ld a, [mapCollectionTableXY+1]
			;add 1 full page to access second map table of samus locator icon Y-offsets
			add a, $01
			ld h, a
			;load the value at that pointer to samus Y offset
			ld e, [hl]
			inc hl
			ld d, [hl]
			ld a, e
			ld [mapSamusLocatorYOffset], a
		;;;;;;;;;;;; experimental - Samus Locator coords update
			ld a, [mapCollectionTableXY]
			ld l, a
			ld a, [mapCollectionTableXY+1]
			;add two full pages to access third map table of samus locator icon X-offsets
			add a, $02
			ld h, a
			;load the value at that pointer to samus X offset
			ld e, [hl]
			inc hl
			ld d, [hl]
			ld a, e
			ld [mapSamusLocatorXOffset], a
	;turn off loadNewMapFlag
	ld a, clear_new_map_flag
	ld [loadNewMapFlag], a
ret ;/

m2maps_pauseAdjustSpriteSetup:
		;set up remaining targets initial X position (+8) in case of targets remaining
			ld a, $a8
			push af
		;draw samus locator sprite
			;top n bottom
			ld a, [hCameraYScreen]
			ld b, a
			ld a, [mapSamusLocatorYOffset]
			add a, b
			rl a
			rl a
			rl a
			ld [$c000], a
			; L n R
			ld a, [hCameraXScreen]
			ld b, a
			ld a, [mapSamusLocatorXOffset]
			add a, b
			rl a
			rl a
			rl a
			ld [$c001], a
			;locator sprite tile art and palette
				;note - need to add this to main hud in bank $0 wherever it skips doing things
				ld a, $00
				ld [$c002], a
				ldh a, [frameCounter]
				bit 3, a
				jr nz, .dontDrawHelm
			ld a, mapIcon_samus
			ld [$c002], a
				.dontDrawHelm:
			ld a, $00
			ld [$c003], a
		;draw time hour hi tile
			ld a, [gameTimeHours]
			and $f0
			sra a
			sra a
			sra a
			sra a
			add $a0
			ld [$9c00], a
		;draw time hour lo tile
			ld a, [gameTimeHours]
			and $0f
			add $a0
			ld [$9c01], a
		;draw time colon on white bg tile
			ld a, tile_colon
			ld [$9c02], a
		;draw time minute hi tile
			ld a, [gameTimeMinutes]
			and $f0
			sra a
			sra a
			sra a
			sra a
			add $a0
			ld [$9c03], a
		;draw time minute hi tile
			ld a, [gameTimeMinutes]
			and $0f
			add $a0
			ld [$9c04], a
		;draw white tile between time and equip
			ld a, tile_white
			ld [$9c05], a
			ld [$9c06], a
			ld [$9c07], a
		;draw equip Samus helm sprite
			ld a, $10
			ld [$c004], a
			ld a, $40
			ld [$c005], a
			ld a, mapIcon_samus
			ld [$c006], a
			ld a, $00
			ld [$c007], a			
		;draw colon tile
			ld a, tile_colon
			ld [$9c08], a
		;draw numbers for count of remaining items to find
			ld a, [mapItemsFound]
			and a, $F0
			sra a
			sra a
			sra a
			sra a
			add a, $a0
			ld [$9c09], a
			ld a, [mapItemsFound]
			and a, $0F
			add a, $a0
			ld [$9c0a], a
		;draw tile for diagonal line separator
			ld a, tile_slash
			ld [$9c0b], a
		;draw tile for max items to find tens and ones
			ld a, total_items
			and a, $f0
			sra a
			sra a
			sra a
			sra a
			add a, $a0
			ld [$9c0c], a					
			ld a, total_items
			and a, $0f
			add a, $a0
			ld [$9c0d], a					
		;draw white tile between equip and 'roids remaining
			ld a, tile_white
			ld [$9c0e], a	
		;draw blank tiles behind Metroid Left sprite
			ld a, tile_blank
			ld [$9c0f], a
			ld [$9c10], a
		;draw metroid remaining L sprite
			ld a, $10
			ld [$c008], a
			ld a, $80
			ld [$c009], a
			ld a, mapIcon_remainingR
			ld [$c00a], a
			ld a, $00
			ld [$c00b], a
		;draw metroid remaining R sprite
			ld a, $10
			ld [$c00c], a
			ld a, $88
			ld [$c00d], a
			ld a, mapIcon_remainingR
			ld [$c00e], a
			ld a, $20
			ld [$c00f], a
		;draw active beam icon
			ld a, $18
			ld [$c010], a
			ld a, $08
			ld [$c011], a
			ld a, $7E
			ld [$c012], a
				ld a, [samusBeam]
				cp $04
				jr nz, .notPlasLoaded
					ld a, $7F
					ld [$c012], a
			.notPlasLoaded:
			ld a, $00
			ld [$c013], a
		;copied from bank 1 - HUD update when paused for metroid count
				ld a, [metroidCountReal]
				cp $ff
				jr z, .else_E
					; Draw normal L counter (tens digit)
					and $f0
					swap a
					add $a0
					ld [$9c12], a
					; Ones digit
					ld a, [metroidCountReal]
					and $0f
					add $a0
					ld [$9c13], a
					jr .next
				.else_E:
					; Draw blank L counter "--"
					ld a, tile_0 ; zero
					ld [$9c12], a
					ld [$9c13], a
			.next:
		;mask message area of pause window black
			ld a, tile_blank
			ld [$9c20], a
			ld [$9c21], a
			ld [$9c22], a
			ld [$9c23], a
			ld [$9c24], a
			ld [$9c25], a
			ld [$9c26], a
			ld [$9c27], a
			ld [$9c28], a
			ld [$9c29], a
			ld [$9c2a], a
			ld [$9c2b], a
			ld [$9c2c], a
			ld [$9c2d], a
			ld [$9c2e], a
			ld [$9c2f], a
			ld [$9c30], a
		;draw map icons from window ram to OAM	
			;init hl to window RAM to read,
			;init de to OAM address to write,
			;start loop: read from hl+.
			;if FF stop
				;else
					;write to B (hi byte of SRAM offset to read)
					;read from hl+ write to C
					;read byte at bc. If not FF do four inc HL
						;read hl+ and write de+ four times			
			;load the read address of window RAM
			ld h, mapIconsWram_hi
			ld l, mapIconsWram_lo
			;load the write address of sprite OAM to begin at
			ld d, mapDotsOAM_hi
			ld e, mapDotsOAM_lo
			.loopSetupMapSprites:
				;Validate that sprite should be drawn; if not skip, if so draw
					ld a, [hl+]
					ld b, a
					ld a, [hl+]
					ld c, a
					;check for endLoop value of $ff
						ld a, b
						cp a, endList
						jr z, .setupMapSpritesExit
					;check for autovalidate value of $c0
						cp a, autoVal
						jr z, .itemValidated
					;if validate required, check if item has been collected (=$02)
					;if not collected, is validated so draw
						ld a, [bc]
						cp a, set_item_collected
						jr z, .isCollected
						;check if it's a target icon and if so do target icon placement
						inc hl
						inc hl
						ld a, [hl]
						cp a, mtT
						jr z, .isTargetIcon
						dec hl
						dec hl
						jr .itemValidated
						;if item SRAM isn't set to COLLECTED, check working RAM
;							ld b, $c5
;							ld a, c
;							and a, $3F
;							add a, $40
;							ld c, a
;							ld a, [bc]
;							cp a, COLLECTED
;							jr nz, .itemValidated
						;if collected, remove this sprite and loop
						.isCollected:
							inc hl
							inc hl
							inc hl
							inc hl
							ld a, tile_blank
							ld [de], a
							inc de
							ld [de], a
							inc de
							ld [de], a
							inc de
							ld [de], a
							inc de
							jr .loopSetupMapSprites
					.isTargetIcon:
						dec hl
						dec hl
						pop af
						sub a, $08
						push af
						ld b, a
						ld a, [hl+]
						ld a, $18
						ld [de], a
						inc de
						ld a, [hl+]
						ld a, b
						ld [de], a
						inc de
						ld a, [hl+]
						ld [de], a
						inc de
						ld a, [hl+]
						ld [de], a
						inc de
					jr .loopSetupMapSprites
				;at this point we are loading sprites	
				.itemValidated:
					ld a, [hl+]
					ld [de], a
					inc de
					ld a, [hl+]
					ld [de], a
					inc de
					ld a, [hl+]
					ld [de], a
					inc de
					ld a, [hl+]
					ld [de], a
					inc de
				jr .loopSetupMapSprites
			.setupMapSpritesExit:
				
	;set window
	ld a, windowHeight_map
	ldh [rWY], a
	;restore stack from target positioning
	pop af
ret

;sprite setup
;$C000..9F: OAM
;    + 0: Y position
;    + 1: X position
;    + 2: Tile number
;    + 3: Attributes
;         10: Palette
;         20: X flip
;         40: Y flip
;         80: Priority (set: behind background)


;loading items:
;c900-cabf is $40 bytes per bank (in debugger 4 lines), 7 banks requires through CABF
;offset is 40 * (bank-9) + c900
;if we know each value of each item, we can have an ID value associated with it that gets loaded
;id is the index to add to our entry point of c900, c940, c980, c9c0, ca00, ca40, ca80
;if that indexed value does not equal FF, do not draw the dot


;below - here, we handle the items-found counter,
;then we load the text for the appropriate item if it's not a refill
m2maps_calcFoundEquipment:
		ld a, b
		cp $10	;new items are $10+
		jr nc, .gotItem
		cp isRefill
		jr nc, .isRefill
;		cp isBeam
;		jr nc, .gotItem
;			ld a, [samusBeam]
;			cp isOutsideBeam
;			jr nz, .notOutsideBeam
;			jr .doNotClearItem
		.gotItem:
			;get sram bank offset from enemy wram
				ld a, [clearItemDotLow]
				add a, clearItem_enemyOffset
				ld e, a
				ld a, [clearItemDotHigh]
				ld d, a
				ld a, [de]
				sub a, clearItem_sramOffsetLo
				ld [clearItemIndex], a
			;set up bank as high byte of de for SRAM address, is $bank - $9 + $c9
				ld a, [currentLevelBank]
				sub a, clearItem_bankOffset
				sra a
				sra a
				add a, clearItem_sramOffsetHi
				ld d, a
				ld [clearItemBank], a
			;loop to set up low byte of de with offset for enemy index for SRAM low address
				ld a, [currentLevelBank]
				sub a, clearItem_bankOffset
				inc a
				and a, clearItem_loopLimit
				ld e, a
				;get a for loop once more
				ld a, [clearItemIndex]
				.loopCurrentCheck
					dec e
					jr z, .stopChecking
					add a, clearItem_sramOffsetLo
					jr .loopCurrentCheck
				.stopChecking:
			;have the byte of SRAM buffer to update as 'item collected'
				ld [clearItemIndex], a
				ld e, a
				ld a, set_item_collected
				ld [de], a
		.doNotClearItem:
			;a bad implementation of converting hex to decimal for display
			ld a, [mapItemsFound]
			and $0f
			cp $09
			jr nz, .notTensOverNine
				ld a, [mapItemsFound]
				add a, $10
				and $f0
				jr .resume
			.notTensOverNine:
				ld a, [mapItemsFound]
				inc a
		.resume:
			ld [mapItemsFound], a
		.notOutsideBeam:
		.isRefill:
	ret




handleBeamCycling:
;veil beam cycling
;after helm is sorted, check if select was pressed.
;if not, skip past
;if so, see what next beam found is
;current beam is entry to collected beam array
;loop 4 times max
;if looped four times, do not update graphics or current beam
;if so, update graphics and current beam, and icon for current beam
	; Toggle missiles if select is pressed
	ld a, [samusBeam]
	cp $00
	ret z
	ldh a, [hInputRisingEdge]
	bit PADB_SELECT, a
	jp z, .doNotCycle
		ld b, $04
		ld a, [samusBeam]
		.tryAgain:
		inc a
		cp $05
		jr nz, .noReset
			ld a, $01
		.noReset:
		push af
			cp $01
			jr nz, .testWave
				ld a, [newItemsEquipped]
				bit itemBit_Ice, a
				jr z, .noTest
				jr .beamIsAvailable
			.testWave:
			cp $02
			jr nz, .testSpazer
				ld a, [newItemsEquipped]
				bit itemBit_Wave, a
				jr z, .noTest
				jr .beamIsAvailable
			.testSpazer:
			cp $03
			jr nz, .testPlasma
				ld a, [newItemsEquipped]
				bit itemBit_Spazer, a
				jr z, .noTest
				jr .beamIsAvailable
			.testPlasma:
			cp $04
			jr nz, .noTest
				ld a, [newItemsEquipped]
				bit itemBit_Plasma, a
				jr z, .noTest
				jr .beamIsAvailable
		.noTest:
		pop af
		dec b
		jr nz, .tryAgain
		jr .doNotCycle
		;we are going to try to cycle
			.beamIsAvailable:
			pop af
			ld hl, samusBeam
			cp a, [hl]
			jr z, .doNotCycle
			ld [samusBeam], a
			; Set to active weapon if missiles aren't active
			ld a, [samusActiveWeapon]
			cp $08
			jp z, .missilesStayActive
				ld a, [samusBeam]
				ld [samusActiveWeapon], a
			.missilesStayActive:
			ld a, [samusBeam]
			cp a, $04
			jr nz, .notPlasma
				ld hl, gfxInfo_plasma
				jr .loadCycledBeam
			.notPlasma:
			cp a, $03
			jr nz, .notSpazer
				ld hl, gfxInfo_spazer
				jr .loadCycledBeam
			.notSpazer:
			cp a, $02
			jr nz, .notWave
				ld hl, gfxInfo_wave
				jr .loadCycledBeam
			;must be $01 ice
			.notWave:
				ld hl, gfxInfo_ice
		;did cycle beam, a=1 will load gfx on return
		.loadCycledBeam:
		ld a, $01
		ret
	;did not cycle beam
	.doNotCycle:
	ld a, $00
ret
;/



;experimental fog vram destinations, 2 tiles each
def vramDest_landingFog = $9660 ; 3 tiles
def vramDest_stationFog = $97E0 ; 2 tiles
def vramDest_port = $9720 ; 1 tiles
def vramDest_lava = $9600 ; 2 tiles
def vramDest_coral = $9650 ; 2 tiles


;experimantal animated tilesheets
;note - need tile set high for each of the 5 tilesets
;note - ruinsInside and plantBubbles can both use the same one for lava
;note - ruinsExt needs to adjust tiles 6 and 7 of lava row (for coral) and not 0 and 1
;note - caveOutside can use the current staion set, duplicated, so it can use the same handler even though it's updating twice
;note - leave landing as-is, since it needs to span three tiles and no good animation candidate is adjacent
graphicsSetLanding:
gfx_landing0::   incbin "gfx/animations/landing0.chr",0,$30
gfx_landing1::   incbin "gfx/animations/landing1.chr",0,$30
gfx_landing2::   incbin "gfx/animations/landing2.chr",0,$30
gfx_landing3::   incbin "gfx/animations/landing3.chr",0,$30
graphicsSetStation: ;as above, but only two acid clouds here
gfx_station0::   incbin "gfx/animations/station0.chr",0,$20
gfx_station1::   incbin "gfx/animations/station1.chr",0,$20
gfx_station2::   incbin "gfx/animations/station2.chr",0,$20
gfx_station3::   incbin "gfx/animations/station3.chr",0,$20
graphicsSetLava:
gfx_lava0::   incbin "gfx/animations/lava0.chr",0,$20
gfx_lava1::   incbin "gfx/animations/lava1.chr",0,$20
gfx_lava2::   incbin "gfx/animations/lava2.chr",0,$20
gfx_lava3::   incbin "gfx/animations/lava3.chr",0,$20
graphicsSetCoral:
gfx_coral0::   incbin "gfx/animations/coral0.chr",0,$20
gfx_coral1::   incbin "gfx/animations/coral1.chr",0,$20
gfx_coral2::   incbin "gfx/animations/coral2.chr",0,$20
gfx_coral3::   incbin "gfx/animations/coral3.chr",0,$20
graphicsSetPort:
gfx_port0::   incbin "gfx/animations/port0.chr",0,$20
gfx_port1::   incbin "gfx/animations/port1.chr",0,$20
gfx_port2::   incbin "gfx/animations/port2.chr",0,$20
gfx_port3::   incbin "gfx/animations/port3.chr",0,$20


;experimental animation of tiles
VBlank_animateTiles:
	;if not playing the game (i.e. dead) don't animate)
	    ldh a, [gameMode]
		cp $04
		jp nz, .noWrap
	;check frame, return if not an update frame
	ldh a, [frameCounter]
	and $0F
	jp z, .doAnimation
	cp $08
	jp z, .doAnimation
	jp .noWrap
	;check tileset, go to Landing on 0
	.doAnimation:
	ld a, [saveBuf_bgGfxSrcHigh]
	cp $60	;if tileset not equal to surface
	jp z, .animateLanding
	cp $58	;if tileset not equal to surface
	jp z, .animatePort ;do camera animation (for now)
	jp c, .animateInside	;do lava animation
	jp nz, .animateOutside ;do coral animation

	.animateLanding:
		;load gfx by frame
		ldh a, [frameCounter]
		and $3F
		cp $20
		jr nc, .hiLandingFrame

		cp $10
		jr nc, .loadLanding1
			ld hl, gfxInfo_landing0
			jr .wrap
		.loadLanding1:
		ld hl, gfxInfo_landing1
		jr .wrap

		.hiLandingFrame:
		cp $30
		jr nc, .loadLanding3
			ld hl, gfxInfo_landing2
			jr .wrap
		.loadLanding3:
		ld hl, gfxInfo_landing3
		jr .wrap

	.animatePort:
		;load gfx by frame
		ldh a, [frameCounter]
		and $3F
		cp $20
		jr nc, .hiPortFrame

		cp $10
		jr nc, .loadPort1
			ld hl, gfxInfo_port0	
			jr .wrap
		.loadPort1:
		ld hl, gfxInfo_port1
		jr .wrap

		.hiPortFrame:
		cp $30
		jr nc, .loadPort3
			ld hl, gfxInfo_port2
			jr .wrap
		.loadPort3:
		ld hl, gfxInfo_port3
		jr .wrap
		
	.animateInside:
		;load gfx by frame
		ldh a, [frameCounter]
		and $3F
		cp $20
		jr nc, .hiInsideFrame

		cp $10
		jr nc, .loadInside1
			ld hl, gfxInfo_inside0	
			jr .wrap
		.loadInside1:
		ld hl, gfxInfo_inside1	
		jr .wrap

		.hiInsideFrame:
		cp $30
		jr nc, .loadInside3
			ld hl, gfxInfo_inside2
			jr .wrap
		.loadInside3:
		ld hl, gfxInfo_inside3
		jr .wrap

	.animateOutside:
		;load gfx by frame
		ldh a, [frameCounter]
		and $3F
		cp $20
		jr nc, .hiOutsideFrame

		cp $10
		jr nc, .loadOutside1
			ld hl, gfxInfo_outside0	
			jr .wrap
		.loadOutside1:
		ld hl, gfxInfo_outside1	
		jr .wrap

		.hiOutsideFrame:
		cp $30
		jr nc, .loadOutside3
			ld hl, gfxInfo_outside2
			jr .wrap
		.loadOutside3:
		ld hl, gfxInfo_outside3
	;fall through to end
	.wrap:
	;add a func to handle a single tile in a given frame
	ld a, [frameCounter]
	and $0F
	cp $00
	jr z, .doNormal
		ld e, a
		ld d, $00
		add hl, de
	.doNormal:
	;ret a 1 to skip hud update due to having run this update
	ld a, $01
	ret
.noWrap:
ld a, $00
ret;/


;gfx info for landing frames
gfxInfo_landing0: db BANK(gfx_landing0)
    dw gfx_landing0, vramDest_landingFog, $0020
	db $00
gfxInfo_landing0A: db BANK(gfx_landing0)
    dw gfx_landing0 + $20, vramDest_landingFog + $20, $0010
	db $00

gfxInfo_landing1: db BANK(gfx_landing1)
    dw gfx_landing1, vramDest_landingFog, $0020
	db $00
gfxInfo_landing1A: db BANK(gfx_landing1)
    dw gfx_landing1 + $20, vramDest_landingFog + $20, $0010
	db $00

gfxInfo_landing2: db BANK(gfx_landing2)
    dw gfx_landing2, vramDest_landingFog, $0020
	db $00
gfxInfo_landing2A: db BANK(gfx_landing2)
    dw gfx_landing2 + $20, vramDest_landingFog + $20, $0010
	db $00

gfxInfo_landing3: db BANK(gfx_landing3)
    dw gfx_landing3, vramDest_landingFog, $0020
	db $00
gfxInfo_landing3A: db BANK(gfx_landing3)
    dw gfx_landing3 + $20, vramDest_landingFog + $20, $0010
	db $00
	
;port tileset animates camera eye for now	
gfxInfo_port0: db BANK(gfx_station0)
    dw gfx_station0, vramDest_stationFog, $0020
	db $00
gfxInfo_port0A: db BANK(gfx_station0)
    dw gfx_port0 + $00, vramDest_port, $0020
	db $00

gfxInfo_port1: db BANK(gfx_station1)
    dw gfx_station1, vramDest_stationFog, $0020
	db $00
gfxInfo_port1A: db BANK(gfx_station1)
    dw gfx_port1 + $00, vramDest_port, $0020
	db $00

gfxInfo_port2: db BANK(gfx_station2)
    dw gfx_station2, vramDest_stationFog, $0020
	db $00
gfxInfo_port2A: db BANK(gfx_station2)
    dw gfx_port2 + $00, vramDest_port, $0020
	db $00

gfxInfo_port3: db BANK(gfx_station3)
    dw gfx_station3, vramDest_stationFog, $0020
	db $00
gfxInfo_port3A: db BANK(gfx_station3)
    dw gfx_port3 + $00, vramDest_port, $0020
	db $00


;outside tileset animates coral	
gfxInfo_outside0: db BANK(gfx_station0)
    dw gfx_station0, vramDest_stationFog, $0020
	db $00
gfxInfo_outside0A: db BANK(gfx_station0)
    dw gfx_coral0 + $00, vramDest_coral, $0020
	db $00

gfxInfo_outside1: db BANK(gfx_station1)
    dw gfx_station1, vramDest_stationFog, $0020
	db $00
gfxInfo_outside1A: db BANK(gfx_station1)
    dw gfx_coral1 + $00, vramDest_coral, $0020
	db $00

gfxInfo_outside2: db BANK(gfx_station2)
    dw gfx_station2, vramDest_stationFog, $0020
	db $00
gfxInfo_outside2A: db BANK(gfx_station2)
    dw gfx_coral2 + $00, vramDest_coral, $0020
	db $00

gfxInfo_outside3: db BANK(gfx_station3)
    dw gfx_station3, vramDest_stationFog, $0020
	db $00
gfxInfo_outside3A: db BANK(gfx_station3)
    dw gfx_coral3 + $00, vramDest_coral, $0020
	db $00


;inside tileset animates lava
gfxInfo_inside0: db BANK(gfx_station0)
    dw gfx_station0, vramDest_stationFog, $0020
	db $00
gfxInfo_inside0A: db BANK(gfx_station0)
    dw gfx_lava0 + $00, vramDest_lava, $0020
	db $00

gfxInfo_inside1: db BANK(gfx_station1)
    dw gfx_station1, vramDest_stationFog, $0020
	db $00
gfxInfo_inside1A: db BANK(gfx_station1)
    dw gfx_lava1 + $00, vramDest_lava, $0020
	db $00

gfxInfo_inside2: db BANK(gfx_station2)
    dw gfx_station2, vramDest_stationFog, $0020
	db $00
gfxInfo_inside2A: db BANK(gfx_station2)
    dw gfx_lava2 + $00, vramDest_lava, $0020
	db $00

gfxInfo_inside3: db BANK(gfx_station3)
    dw gfx_station3, vramDest_stationFog, $0020
	db $00
gfxInfo_inside3A: db BANK(gfx_station3)
    dw gfx_lava3 + $00, vramDest_lava, $0020
	db $00


