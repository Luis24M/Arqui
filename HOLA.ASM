.286
pila segment stack
    db 32 DUP('stack--')
pila ends 

datos segment 
    letrero db  'Hola Mundo$'
datos ends 

codigo segment 'code'
main proc FAR
    assume cs:codigo, ds:datos, ss:pila

    mov ax, datos
    mov ds, ax
    
    mov ah, 09h
    mov dx, offset letrero
    int 21h

    mov ah, 4ch
    int 21h

    ret
main endp
codigo ends
end main