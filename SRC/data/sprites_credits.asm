; Sprite Pointers
creditsSpritePointerTable:

    dw sprite_titleStart ; 00
    dw sprite_titleClear ; 01
    dw sprite7638 ; 02
    dw sprite763D ; 03
    dw sprite7642 ; 04
    dw sprite7647 ; 05
    dw sprite7609 ; 06
    dw sprite7578 ; 07
    dw sprite74A5 ; 08
    dw sprite74E6 ; 09
    dw sprite7537 ; 0a
    dw sprite764C ; 0b
    dw sprite7675 ; 0c
    dw sprite7609 ; 0d
    dw sprite7796 ; 0e
    dw sprite77A7 ; 0f
    dw sprite77C0 ; 10
    dw sprite780D ; 11
    dw sprite7876 ; 12
    dw sprite78FB ; 13
    dw sprite7910 ; 14
    dw sprite7935 ; 15
    dw sprite7946 ; 16
    dw sprite7957 ; 17
    dw sprite7970 ; 18
    dw sprite7985 ; 19
    dw sprite7996 ; 1a
    dw sprite79AB ; 1b
    dw sprite79B0 ; 1c
    dw sprite79B5 ; 1d
    dw sprite79D2 ; 1e
    dw sprite7692 ; 1f
    dw sprite76D3 ; 20
    dw sprite7714 ; 21
    dw sprite7755 ; 22
    dw sprite7496 ; 23 - File 1
    dw sprite749B ; 24 - File 2
    dw sprite74A0 ; 25 - File 3


; Metasprite Data:
sprite7496:
    db   0, 54, $FB, $80
    db METASPRITE_END
sprite749B:
    db   0, 54, $FC, $80
    db METASPRITE_END
sprite74A0:
    db   0, 54, $FD, $80
    db METASPRITE_END
sprite74A5:
    db -24,-20, $00, $80
    db -24,-12, $01, $80
    db -24, -4, $02, $80
    db -24,  4, $03, $80
    db -24, 12, $04, $80
    db -16,-20, $05, $80
    db -16,-12, $06, $80
    db -16, -4, $07, $80
    db -16,  4, $08, $80
    db -16, 12, $09, $80
    db  -8,-20, $0A, $80
    db  -8,-12, $0B, $80
    db  -8, -4, $0C, $80
    db  -8,  4, $0D, $80
    db  -8, 12, $0E, $80
    db   0, 12, $12, $80
    db METASPRITE_END
sprite74E6:
    db -24,-20, $1A, $80
    db -24,-12, $1B, $80
    db -24, -4, $1C, $80
    db -24,  4, $1D, $80
    db -24, 12, $1E, $80
    db -16,-20, $1F, $80
    db -16,-12, $20, $80
    db -16, -4, $21, $80
    db -16,  4, $22, $80
    db -16, 12, $23, $80
    db  -8,-20, $24, $80
    db  -8,-12, $25, $80
    db  -8, -4, $26, $80
    db  -8,  4, $27, $80
    db  -8, 12, $28, $80
    db   0,-20, $29, $80
    db   0,-12, $2A, $80
    db   0, -4, $2B, $80
    db   0,  4, $2C, $80
    db   0, 12, $2D, $80
    db METASPRITE_END
sprite7537:
    db -24,-20, $35, $80
    db -24,-12, $36, $80
    db -24, -4, $37, $80
    db -24,  4, $38, $80
    db -24, 12, $39, $80
    db -16,-20, $3A, $80
    db -16,-12, $3B, $80
    db -16, -4, $3C, $80
    db -16,  4, $3D, $80
    db -16, 12, $3E, $80
    db  -8,-20, $3F, $80
    db  -8,-12, $40, $80
    db  -8, -4, $41, $80
    db  -8,  4, $42, $80
    db  -8, 12, $43, $80
    db   0,-20, $44, $80
    db METASPRITE_END
sprite7578:
    db -24,-20, $53, $80
    db -24,-12, $54, $80
    db -24, -4, $55, $80
    db -24,  4, $56, $80
    db -24, 12, $57, $80
    db -16,-20, $58, $80
    db -16,-12, $59, $80
    db -16, -4, $5A, $80
    db -16,  4, $5B, $80
    db -16, 12, $5C, $80
    db  -8,-16, $5D, $80
    db  -8, -8, $5E, $80
    db  -8,  0, $5F, $80
    db  -8,  8, $60, $80
    db   0,-20, $61, $80
    db   0,-12, $62, $80
    db   0, -4, $63, $80
    db   0,  4, $64, $80
    db   0, 12, $65, $80
    db   8,-20, $66, $80
    db   8,-12, $67, $80
    db   8, -4, $68, $80
    db   8,  4, $69, $80
    db   8, 12, $6A, $80
    db  16,-20, $6B, $80
    db  16,-12, $6C, $80
    db  16, -4, $6D, $80
    db  16,  4, $6E, $80
    db  24,-12, $6F, $80
    db  24,  3, $6F, $A0
    db  32,-12, $70, $80
    db  32,  3, $70, $A0
    db  40,-20, $71, $80
    db  40,-12, $72, $80
    db  40,  3, $72, $A0
    db  40, 11, $71, $A0
    db METASPRITE_END
sprite7609:
    db   0,  -8, $EE, $80
    db   0,  -16, $ED, $80
    db METASPRITE_END
sprite_titleStart:
    db   0,  0, $F1, $00
    db   0,  8, $F2, $00
    db   0, 16, $F3, $00
    db   0, 24, $F4, $00
    db   0, 32, $F5, $00
    db METASPRITE_END
sprite_titleClear:
    db   0,  0, $F6, $00
    db   0,  8, $F7, $00
    db   0, 16, $F8, $00
    db   0, 24, $F9, $00
    db   0, 32, $FA, $00
    db METASPRITE_END
sprite7638:
    db   0,  0, $F0, $00
    db   0,  8, $FE, $00
    db METASPRITE_END
sprite763D:
    db   0,  0, $F0, $00
    db   0,  8, $FE, $00
    db METASPRITE_END
sprite7642:
    db   0,  0, $F0, $00
    db   0,  8, $FE, $00
    db METASPRITE_END
sprite7647:
    db   0,  0, $F0, $00
    db METASPRITE_END
sprite764C:
    db   0,-12, $0F, $80
    db   0, -4, $10, $80
    db   0,  4, $11, $80
    db   8, -8, $13, $80
    db   8,  0, $14, $80
    db  16, -8, $15, $80
    db  16,  0, $16, $80
    db  24,  0, $17, $80
    db  32,  0, $18, $80
    db  40, -1, $19, $80
    db METASPRITE_END
sprite7675:
    db   8,-12, $2E, $80
    db   8, -4, $2F, $80
    db   8,  4, $30, $80
    db  16, -8, $31, $80
    db  16,  0, $32, $80
    db  24, -1, $33, $80
    db  32, -1, $34, $80
    db METASPRITE_END
sprite7692:
    db -16,-16, $45, $80
    db -16, -8, $46, $80
    db -16,  0, $46, $A0
    db -16,  8, $45, $A0
    db  -8,-16, $47, $80
    db  -8, -8, $48, $80
    db  -8,  0, $48, $A0
    db  -8,  8, $47, $A0
    db   0,-16, $49, $80
    db   0, -8, $4A, $80
    db   0,  0, $4A, $A0
    db   0,  8, $49, $A0
    db   8,-16, $4B, $80
    db   8, -8, $4C, $80
    db   8,  0, $4C, $A0
    db   8,  8, $4B, $A0
    db METASPRITE_END
sprite76D3:
    db -16,-16, $4D, $80
    db -16, -8, $4E, $80
    db -16,  0, $4E, $A0
    db -16,  8, $4D, $A0
    db  -8,-16, $4F, $80
    db  -8, -8, $50, $80
    db  -8,  0, $50, $A0
    db  -8,  8, $4F, $A0
    db   0,-16, $4F, $C0
    db   0, -8, $50, $C0
    db   0,  0, $50, $E0
    db   0,  8, $4F, $E0
    db   8,-16, $4B, $80
    db   8, -8, $4C, $80
    db   8,  0, $4C, $A0
    db   8,  8, $4B, $A0
    db METASPRITE_END
sprite7714:
    db -16,-16, $4B, $C0
    db -16, -8, $4C, $C0
    db -16,  0, $4C, $E0
    db -16,  8, $4B, $E0
    db  -8,-16, $49, $C0
    db  -8, -8, $4A, $C0
    db  -8,  0, $4A, $E0
    db  -8,  8, $49, $E0
    db   0,-16, $47, $C0
    db   0, -8, $48, $C0
    db   0,  0, $48, $E0
    db   0,  8, $47, $E0
    db   8,-16, $45, $C0
    db   8, -8, $46, $C0
    db   8,  0, $46, $E0
    db   8,  8, $45, $E0
    db METASPRITE_END
sprite7755:
    db -16,-16, $4B, $C0
    db -16, -8, $4C, $C0
    db -16,  0, $4C, $E0
    db -16,  8, $4B, $E0
    db  -8,-16, $49, $C0
    db  -8, -8, $4A, $C0
    db  -8,  0, $4A, $E0
    db  -8,  8, $49, $E0
    db   0,-16, $49, $80
    db   0, -8, $4A, $80
    db   0,  0, $4A, $A0
    db   0,  8, $49, $A0
    db   8,-16, $4B, $80
    db   8, -8, $4C, $80
    db   8,  0, $4C, $A0
    db   8,  8, $4B, $A0
    db METASPRITE_END
sprite7796:
    db -32, -8, $AA, $80
    db -32,  0, $AB, $80
    db -24, -8, $AC, $80
    db -24,  0, $AD, $80
    db METASPRITE_END
sprite77A7:
    db -16,-16, $AE, $80
    db -16, -8, $AF, $80
    db  -8,-16, $B2, $80
    db  -8, -8, $B3, $80
    db   0,-16, $B6, $80
    db   8,-16, $BA, $80
    db METASPRITE_END
sprite77C0:
    db -16,  0, $B0, $80
    db -16,  8, $B1, $80
    db  -8,  0, $B4, $80
    db  -8,  8, $B5, $80
    db   0, -8, $B7, $80
    db   0,  0, $B8, $80
    db   0,  8, $B9, $80
    db   8, -8, $BB, $80
    db   8,  0, $BC, $80
    db   8,  8, $BD, $80
    db  16, -8, $BE, $80
    db  16,  0, $BF, $80
    db  24, -5, $C0, $80
    db  24,  3, $C1, $80
    db  32, -5, $C2, $80
    db  32,  3, $C3, $80
    db  40, -8, $C4, $80
    db  40,  0, $C5, $80
    db  40,  8, $C6, $80
    db METASPRITE_END
sprite780D:
    db   0, -8, $90, $80
    db   0,  0, $91, $80
    db   8, -8, $92, $80
    db   8,  0, $93, $80
    db   8,  8, $94, $80
    db   8, 16, $95, $80
    db  16,-16, $96, $80
    db  16, -8, $97, $80
    db  16,  0, $98, $80
    db  16,  8, $99, $80
    db  16, 16, $9A, $80
    db  24,-24, $9B, $80
    db  24,-16, $9C, $80
    db  24, -8, $9D, $80
    db  24,  0, $9E, $80
    db  24,  8, $9F, $80
    db  24, 18, $A0, $80
    db  32,-24, $A1, $80
    db  32,-16, $A2, $80
    db  32, -8, $A3, $80
    db  32,  0, $A4, $80
    db  32,  8, $A5, $80
    db  40,-16, $A6, $80
    db  40, -8, $A7, $80
    db  40,  0, $A8, $80
    db  40,  8, $A9, $80
    db METASPRITE_END
sprite7876:
    db   0,-20, $53, $80
    db   0,-12, $54, $80
    db   0, -4, $55, $80
    db   0,  4, $56, $80
    db   0, 12, $57, $80
    db   8,-20, $73, $80
    db   8,-12, $74, $80
    db   8, -4, $75, $80
    db   8,  4, $76, $80
    db   8, 12, $77, $80
    db  16,-20, $78, $80
    db  16,-12, $79, $80
    db  16, -4, $7A, $80
    db  16,  4, $7B, $80
    db  16, 12, $7C, $80
    db  16, 20, $7D, $80
    db  24,-28, $7E, $80
    db  24,-20, $7F, $80
    db  24,-12, $80, $80
    db  24, -4, $81, $80
    db  24,  4, $82, $80
    db  24, 12, $83, $80
    db  24, 20, $84, $80
    db  32,-28, $85, $80
    db  32,-20, $86, $80
    db  32,-12, $87, $80
    db  32, -4, $88, $80
    db  32,  4, $89, $80
    db  32, 12, $8A, $80
    db  40,-20, $8B, $80
    db  40,-12, $8C, $80
    db  40, -4, $8D, $80
    db  40,  4, $8E, $80
    db METASPRITE_END
sprite78FB:
    db -16,-24, $C7, $80
    db -16,-16, $C8, $80
    db -16, -8, $C9, $80
    db  -8,-16, $CA, $80
    db  -8, -8, $CB, $80
    db METASPRITE_END
sprite7910:
    db -32,-16, $CC, $80
    db -32, -8, $CD, $80
    db -32,  0, $AB, $80
    db -24,-16, $CE, $80
    db -24, -8, $CF, $80
    db -24,  0, $AD, $80
    db -16,-16, $D0, $80
    db -16, -8, $D1, $80
    db  -8, -8, $D2, $80
    db METASPRITE_END
sprite7935:
    db -32, -8, $E3, $80
    db -32,  0, $E4, $80
    db -24, -8, $E5, $80
    db -24,  0, $E6, $80
    db METASPRITE_END
sprite7946:
    db -32, -8, $E7, $80
    db -32,  0, $E8, $80
    db -24, -8, $E9, $80
    db -24,  0, $EA, $80
    db METASPRITE_END
sprite7957:
    db -32,-16, $D4, $80
    db -32, -8, $D5, $80
    db -32,  0, $D6, $80
    db -24,-16, $D7, $80
    db -24, -8, $D8, $80
    db -24,  0, $D9, $80
    db METASPRITE_END
sprite7970:
    db -32, -8, $DA, $80
    db -32,  0, $DB, $80
    db -24,-16, $DC, $80
    db -24, -8, $DD, $80
    db -24,  0, $DE, $80
    db METASPRITE_END
sprite7985:
    db -32, -8, $DF, $80
    db -32,  0, $E0, $80
    db -24, -8, $E1, $80
    db -24,  0, $E2, $80
    db METASPRITE_END
sprite7996:
    db -32, -8, $DA, $80
    db -32,  0, $DB, $80
    db -24,-16, $EB, $80
    db -24, -8, $EC, $80
    db -24,  0, $ED, $80
    db METASPRITE_END
sprite79AB:
    db  -4, -4, $EE, $80
    db METASPRITE_END
sprite79B0:
    db  -4, -4, $EF, $80
    db METASPRITE_END
sprite79B5:
    db  -8,-16, $F0, $80
    db  -8, -8, $F1, $80
    db  -8,  0, $F2, $80
    db   0,-16, $F6, $80
    db   0, -8, $F7, $80
    db   0,  0, $F8, $80
    db   0,  8, $F9, $80
    db METASPRITE_END
sprite79D2:
    db  -8,-16, $F3, $80
    db  -8, -8, $F4, $80
    db  -8,  8, $F5, $80
    db   0,-16, $FA, $80
    db   0, -8, $FB, $80
    db   0,  0, $FC, $80
    db   0,  8, $FD, $80
    db METASPRITE_END
