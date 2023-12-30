.MODEL SMALL  ; Declaración del modelo de memoria SMALL para programas pequeños de DOS
.CODE; Declaración de la sección de código
START:        ; Etiqueta de punto de entrada
    MOV DL, 5AH  ; Mueve el valor hexadecimal 5A a DL (carácter Z)
    MOV AH, 02H  ; Mueve el valor 02H a AH (función de impresión de carácter)

BUCLE: 
    INT 21H      ; Llamada a la interrupción 21H del sistema DOS (imprimir carácter)
    MOV BL, DL   ; Mueve el valor de DL (carácter) a BL
    MOV DL, 20H  ; Mueve el valor hexadecimal 20 a DL (espacio)
    INT 21H      ; Llamada a la interrupción 21H del sistema DOS (imprimir espacio)
    MOV DL, BL   ; Mueve el valor de BL (carácter original) de nuevo a DL
    CMP DL, 58H  ; Compara DL con el valor hexadecimal 58 (carácter X)
    JE FIN       ; Salta a FIN si son iguales
    DEC DL       ; Decrementa el valor en DL
    JMP BUCLE    ; Salto incondicional a BUCLE

FIN: 
    INT 20H      ; Llamada a la interrupción 20H del sistema DOS (terminar programa)
    END START   ; Fin del programa con la etiqueta de punto de entrada
