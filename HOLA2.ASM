.model small
.stack
.data
    letrero db 'Arquitectura de computadoras$'
.code
main proc FAR
    mov ax, @data
    mov ds, ax
    mov ah, 09h
    ;mov dx, offset letrero
    lea dx, letrero
    int 21h
    
    mov ah, 4ch
    int 21h
    ret
    .exit
main endp
end main