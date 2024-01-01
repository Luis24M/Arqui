section .data
    hello db 'Hola, Mundo!', 0

section .text
    global _start

_start:
    ; Escribir el mensaje en la consola
    mov eax, 4          ; System call para sys_write
    mov ebx, 1          ; Descriptor de archivo: STDOUT
    mov ecx, hello      ; Puntero al mensaje
    mov edx, 13         ; Longitud del mensaje
    int 0x80            ; Llamada al sistema

    ; Agregar un punto de interrupción para depurar
    int 3

    ; Salir del programa
    mov eax, 1          ; System call para sys_exit
    xor ebx, ebx        ; Código de salida 0
    int 0x80            ; Llamada al sistema
