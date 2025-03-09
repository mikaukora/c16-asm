.segment "CODE"
.global _start

_start:
    sei                     ; Disable interrupts
    cld                     ; Clear decimal mode

    ; Clear the screen
    lda #$93                ; PETSCII clear screen
    jsr $ffd2               ; CHROUT kernel routine

    ; Set colors
    lda #$66
    sta $FF15               ; Background color
    lda #$66
    sta $FF19               ; Border color

    ; Convert and store message in screen memory
    ldx #0
char_loop:
    lda message, x          ; Load PETSCII character from message
    beq done                ; If 0 (end of string), stop

    sec                     ; Set carry for subtraction
    sbc #$40                ; Convert from ASCII to PETSCII
    sta $0C00, x            ; Store in screen memory
    inx
    bne char_loop           ; Repeat for next character

done:
    brk

.segment "DATA"
message: .byte "HELLO", 0
