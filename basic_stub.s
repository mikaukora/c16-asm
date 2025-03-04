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
    .global _start          ; Ensure main program provides _start
    jmp _start              ; Jump to program entry point
