.model SMALL
.STACK
.DATA
    resultado db 6 DUP(?) ; Buffer para almacenar la representación en cadena del resultado
.CODE
    inicio: 
        mov ax, @data
        mov ds, ax

        mov al, 0A3h  ; Valor original de al
        sub al, 5Dh   ; Resta 5Dh de al

        ; Convierte el valor numérico en cadena (formato decimal)
        mov ah, 0     ; Inicializa el registro ah en 0 para la función de conversión a cadena
        mov si, OFFSET resultado
        mov di, 10    ; Base decimal
        call ConvertirAString

        ; Ahora, resultado contiene la representación en cadena del valor numérico

        ; Imprime la cadena usando la función de impresión
        mov ah, 09h
        lea dx, resultado
        int 21h

        mov ah, 4ch
        int 21h

ConvertirAString PROC
    ; Convierte el valor numérico en al a una cadena en resultado
    push ax
    push bx
    push cx
    push dx
    push di
    push si  ; Guardamos el valor de si en la pila

    mov cx, 0      ; Inicializa el contador de caracteres

    ; Hace un bucle hasta que al sea 0
    bucle:
        xor dx, dx         ; Inicializa dx en 0 antes de la división
        div di             ; Divide ax por 10, el cociente va a al y el residuo a dx
        add dl, '0'        ; Convierte el residuo a carácter ASCII
        dec si             ; Mueve el índice en el buffer hacia atrás
        mov [si], dl       ; Almacena el carácter en el buffer
        inc cx             ; Incrementa el contador de caracteres
        test ax, ax        ; Comprueba si ax es 0
        jnz bucle          ; Si no es cero, repite el bucle

    ; Pone un '$' al final de la cadena para indicar el final
    mov byte ptr [si], '$'

    ; Invierte la cadena en resultado
    mov si, OFFSET resultado
    mov di, cx
    shr di, 1

    ; Utiliza bx para intercambiar bytes
    mov bx, si
    add bx, di
    sub bx, 1

    rev:
        mov al, [si]
        mov ah, [bx]
        mov [si], ah
        mov [bx], al

        inc si
        dec bx
        jnz rev

    fin:
    pop si  ; Restauramos el valor de si desde la pila
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
ConvertirAString ENDP

END inicio
