; Disassembly of "Metroid2.gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

; Patched in at runtime
gfx_cannonBeam:: incbin "gfx/samus/cannonBeam.chr"
gfx_cannonMissile:: incbin "gfx/samus/cannonMissile.chr"

; These graphics are patched into VRAM when loading a save or collecting the item
gfx_beamIce:: incbin "gfx/samus/beamIce.chr"
gfx_beamWave:: incbin "gfx/samus/beamWave.chr"
gfx_beamSpazer:: ; Stub for an enterprising modder
gfx_beamPlasma:: incbin "gfx/samus/beamSpazerPlasma.chr"

gfx_spinSpaceTop:: incbin "gfx/samus/spinSpaceTop.chr"
gfx_spinSpaceBottom:: incbin "gfx/samus/spinSpaceBottom.chr"

gfx_spinScrewTop:: incbin "gfx/samus/spinScrewTop.chr"
gfx_spinScrewBottom:: incbin "gfx/samus/spinScrewBottom.chr"

gfx_spinSpaceScrewTop:: incbin "gfx/samus/spinSpaceScrewTop.chr"
gfx_spinSpaceScrewBottom:: incbin "gfx/samus/spinSpaceScrewBottom.chr"
	
gfx_springBallTop::	incbin "gfx/samus/springBallTop.chr"
gfx_springBallBottom:: incbin "gfx/samus/springBallBottom.chr"

; 06:4320 - Power suit and common sprite graphics
gfx_samusPowerSuit:: incbin "gfx/samus/samusPowerSuit.chr"

; 06:4E20
gfx_samusVariaSuit:: incbin "gfx/samus/samusVariaSuit.chr"

; 06:5920 - Enemy graphics pages -- 64 tiles each
gfx_enemiesA::   incbin "gfx/enemies/enemiesA.chr",0,$400
gfx_enemiesB::   incbin "gfx/enemies/enemiesB.chr",0,$400
gfx_enemiesC::   incbin "gfx/enemies/enemiesC.chr",0,$400
gfx_enemiesD::   incbin "gfx/enemies/enemiesD.chr",0,$400
gfx_enemiesE::   incbin "gfx/enemies/enemiesE.chr",0,$400
gfx_enemiesF::   incbin "gfx/enemies/enemiesF.chr",0,$400
gfx_arachnus::   incbin "gfx/enemies/arachnus.chr",0,$400
gfx_surfaceSPR:: incbin "gfx/enemies/surfaceSPR.chr",0,$400

; 06:7920
creditsText: include "data/credits.asm"

spiderBallOrientationTable:: ;{ 06:7E03
; Given an input and a collision state, this produces a rotational direction for the spider ball
; - Note that this only considers cardinal directions. Perhaps, by adding 
;  data for diagonal directions, the controls of the spider ball could be improved
;
; Values
;  0: Don't move
;  1: Move counter-clockwise
;  2: Move clockwise
;       ______________________________________________ 0: No input
;      |   ___________________________________________ 1: Right
;      |  |   ________________________________________ 2: Left
;      |  |  |   _____________________________________ 3: X: R+L
;      |  |  |  |   __________________________________ 4: Up
;      |  |  |  |  |   _______________________________ 5: R+U
;      |  |  |  |  |  |   ____________________________ 6: L+U
;      |  |  |  |  |  |  |   _________________________ 7: X: R+L+U
;      |  |  |  |  |  |  |  |   ______________________ 8: Down
;      |  |  |  |  |  |  |  |  |   ___________________ 9: D+R
;      |  |  |  |  |  |  |  |  |  |   ________________ A: D+L
;      |  |  |  |  |  |  |  |  |  |  |   _____________ B: X: R+L+U
;      |  |  |  |  |  |  |  |  |  |  |  |   __________ C: X: U+D
;      |  |  |  |  |  |  |  |  |  |  |  |  |   _______ D: X: R+U+D
;      |  |  |  |  |  |  |  |  |  |  |  |  |  |   ____ E: X: L+U+D
;      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   _ F: X: R+L+U+D
;      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
;    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    0: In air
;    db 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    1: Outside corner: Of left-facing wall and ceiling
;    db 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0 ;    2: Outside corner: Of left-facing wall and floor
;    db 0, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0 ;    3: Flat surface:   Left-facing wall
;    db 0, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    4: Outside corner: Of right-facing wall and ceiling
;    db 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    5: Flat surface:   Ceiling
;    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    6: Unused:         Top-left and bottom-right corners of ball in contact
;    db 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0 ;    7: Inside corner:  Of left-facing wall and ceiling
;    db 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ;    8: Outside corner: Of right-facing wall and floor
;    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    9: Unused:         Bottom-left and top-right corners of ball in contact
;    db 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    A: Flat surface:   Floor
;    db 0, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    B: Inside corner:  Of left-facing wall and floor
;    db 0, 0, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ;    C: Flat surface:   Right-facing wall
;    db 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ;    D: Inside corner:  Of right-facing wall and ceiling
;    db 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    E: Inside corner:  Of right-facing wall and floor
;    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    F: Unused:         Embedded in solid

;MODDED TABLE, thanks RT-55J!
; Given an input and a spider ball collision state, this table
;  produces a rotational direction for the spider ball.
;  - Values
;     0: Don't move
;     1: Move counter-clockwise
;     2: Move clockwise
; (Note: "clockwise" here assumes that the ball rolling inside a box)
;
;  The original table only filled in two entries per row, resulting 
; in some really awkward fiddliness if you happen to stop on a corner.
;
;  This new table fills in six entries per row, allowing for diagonal
; inputs and secondary directions where it would make sense.  I would
; have filled in all 8 valid inputs per row, but in every case I determined
; that the result would have been unintuitive.

;                     U  U        D  D                <- Inputs  States -\
;      x  R  L  x  U  R  L  x  D  R  L  x  x  x  x  x                    |
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    0: In air     v
    db 0, 2, 1, 0, 1, 0, 1, 0, 2, 2, 0, 0, 0, 0, 0, 0 ;    1: Outside corner: Of left-facing wall and ceiling
    db 0, 1, 2, 0, 1, 1, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0 ;    2: Outside corner: Of left-facing wall and floor
    db 0, 0, 0, 0, 1, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0 ;    3: Flat surface:   Left-facing wall
    db 0, 2, 1, 0, 2, 2, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0 ;    4: Outside corner: Of right-facing wall and ceiling
    db 0, 2, 1, 0, 0, 2, 1, 0, 0, 2, 1, 0, 0, 0, 0, 0 ;    5: Flat surface:   Ceiling
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    6: Unused:         Top-left and bottom-right corners of ball in contact
    db 0, 2, 1, 0, 1, 0, 1, 0, 2, 2, 0, 0, 0, 0, 0, 0 ;    7: Inside corner:  Of left-facing wall and ceiling
    db 0, 1, 2, 0, 2, 0, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0 ;    8: Outside corner: Of right-facing wall and floor
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    9: Unused:         Bottom-left and top-right corners of ball in contact
    db 0, 1, 2, 0, 0, 1, 2, 0, 0, 1, 2, 0, 0, 0, 0, 0 ;    A: Flat surface:   Floor
    db 0, 1, 2, 0, 1, 1, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0 ;    B: Inside corner:  Of left-facing wall and floor
    db 0, 0, 0, 0, 2, 2, 2, 0, 1, 1, 1, 0, 0, 0, 0, 0 ;    C: Flat surface:   Right-facing wall
    db 0, 2, 1, 0, 2, 2, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0 ;    D: Inside corner:  Of right-facing wall and ceiling
    db 0, 1, 2, 0, 2, 0, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0 ;    E: Inside corner:  Of right-facing wall and floor
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;    F: Unused:         Embedded in solid

; Notes about the collision state:
;
;  When using the spider ball, the game checks the collision state
;   of 8 points along its perimeter. For each point that is in contact
;   with a solid surface, the following bitmasks are applied (OR'd)
;   to the spider ball's collision state:
;
; Point Bitmasks
;   0    %0001
;   1    %0010                    2 _6_ 0
;   2    %0100                     /   \
;   3    %1000                    5|   |4
;   4    %0011                     \___/
;   5    %1100                    3  7  1
;   6    %0101
;   7    %1010
;
; Notice that the bitmasks for the sides are the OR'd sum of the bitmasks their
;  adjacent corners.

;}

bank6_freespace: ; 06:7F03 - Freespace