    .segment "CODE"
    .global _start

_start:
    sei                     ; Disable interrupts
    cld                     ; Clear decimal mode

    ; Clear the screen
    lda #$93                ; PETSCII clear screen
    jsr $ffd2               ; CHROUT kernel routine

    ; Initialize correct colors for C16
    lda #$05
    sta $FF15               ; Background color
    rol
    sta $FF19               ; Border color
