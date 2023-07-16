; 8:7EFA - Solidity threshholds
; samus solidity / beam solidity / enemy solidity
    db $54, $54, $54, $ff ; 0 - plantBubbles -1
    db $4e, $4e, $4e, $ff ; 1 - ruinsInside - 2
    db $f0, $f0, $f0, $ff ; 2 - queen - 3
    db $56, $56, $56, $ff ; 3 - caveFirst - 4
    db $59, $59, $59, $ff ; 4 - surface - 5
    db $42, $42, $42, $ff ; 5 - lavaCaves -6 
    db $56, $56, $56, $ff ; 6 - ruinsExt -7 
    db $75, $75, $75, $ff ; 7 - finalLab - 8

;item collection vals
;01  dw pickup_plasmaBeam
;02  dw pickup_iceBeam
;03  dw pickup_waveBeam
;04  dw pickup_spazer
;05  dw pickup_bombs
;06  dw pickup_screwAttack
;07  dw pickup_variaSuit
;08  dw pickup_hiJump
;09  dw pickup_spaceJump
;0A  dw pickup_spiderBall
;0B  dw pickup_springBall
;0C  dw pickup_energyTank
;0D  dw pickup_missileTank
;0E  dw pickup_energyRefill
;0F  dw pickup_missileRefill

;;; be cool to swap a Met from lair2 or 'access' to dome1 Intterior
;area  gfx       spr song met a/b/o
;docks caveFirst A   5    1   1/1/0 ;1 on way in, one on escape
;dome1 ruinsExt  A   3    1   0/1/0
;dome1 ruinsIns  F   9    0   2/0/0
;lair1 plantBub  E   D    3   2/1/1
;dome2 ruinsExt  A   3    1   1/0/0
;dome2 ruinsIns  F   9    2   0/2/0
;lair2 plantBub  E   D    4   2/1/1
;acces plantBub  E   8    6   2/2/2
;;; 2 metroids in bank 5 rooms in upper 5x4 block of rooms in editor
;;; will need to a map 2 interior room - before bombs, and 
;;; (bank_00d / mapTables4 m0c -> m02 lair interior)
;;; and then just increase the counter by 2

;lair 1 - omega is exterior, 2 alphas interior, lair has omega at bottom left and 2 alphas as normal

;lair2 modified so enemies in all central areas possible, with pirates at the endpoints
;it now goes like so:
; X X X X X X X X 3 X X X X
; X X X X 2 1 1 1 3 1 1 2 2
; 2 3 3 3 2 3 3 2 2 2 2 3 3
; 
; with placements:
; X X X X X X X X A X X X X
; X X X X 2 1 1 1 3 1 1 2 A
; G 3 3 3 2 3 3 2 2 2 2 3 O

;access area has leftmost metroid made alpha, bottom center made omega, and space jump made omega

;bank D items / metroids start at index 60 (20) and refills / beams are 1F
;60 - dome 1 inside bomb missile
;61 - dome 1 inside upper exit missile 1/2
;62 - dome 1 inside science etank
;63 - dome 1 inside bomb
;64 - dome 1 inside central hall metroid alpha
;65 - dome 1 inside upper exit missile 2/2
;66 - dome 1 inside ice beam missiles
;67 - dome 1 inside rightmost exit missiles
;68 - dome 1 inside ice beam gadora
;69 - dome 2 inside springball
;6A - dome 1 inside bomb gadora
;6B - dome 1 inside bomb metroid alpha
;6C - dome 2 inside pipe curve missiles
;6D - dome 2 inside springball missiles
;6E - dome 2 inside springball gadora
;6F - dome 2 inside springball metroid omega
;70 - dome 2 inside arachnus / varia
;71 - dome 2 inside wave beam metroid omega
;72 - dome 2 inside hijump missiles
;73 - dome 2 inside wave beam gadora
;74 - dome 2 inside hijump gadora
;75 - dome 2 inside hijump
;76 - dome 1 inside central hall metroid's missiles
;77 - 
;78 - 
;79 - 
;7A - 
;7B - 
;7C - 
;7D - 
;7E - 
;7F - 

;bank A used IDs:
;7f final metroid
;7e energy tank in engineering
;7d springball
;7c missile on left side
;7b shaft metroid by etank
;7a zebetite by left side missile
;79 new missile in central shaft