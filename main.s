.segment "HEADER"
    .word $1001             ; Start address for PRG file

.segment "BASIC"
    .word endline           ; Pointer to the next BASIC line
    .word 10                ; Line number
    .byte $9e               ; SYS token
    .byte "4109"            ; Decimal address for SYS command (match CODE segment)
    .byte 0                 ; End of line
endline:
    .word 0                 ; End of BASIC program

.segment "CODE"
start:
    sei                     ; Disable interrupts
    cld                     ; Clear decimal mode

    ; Clear the screen
    lda #$93                ; PETSCII clear screen
    jsr $ffd2               ; CHROUT kernel routine

    ; Initialize correct colors for C16
    lda #$05                ;
    sta $FF15               ; Background color
    rol
    sta $FF19               ; Border color
    brk
