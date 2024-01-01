.MODEL SMALL
.STACK 20h
.DATA
	Descripcion		DB 'Programa que ingresa un caracter desde teclado$'
	Ingresar		DB 10,13,'Ingrese un caracter: $'
	Fin		DB 10,13,'Fin del programa, $'
	Piqui			DB 10,13,'El caracter que ingresaste es el $'	
		
.CODE
	inicio: 
		mov ax,	@Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset Descripcion
		int 21h
		
		mov ah, 09h
		mov dx, offset Ingresar
		int 21h
		
		mov ah, 01 ; Lee un caracter desde teclado
		int 21h
		
		mov cl, al ; Guarda el caracter en cl
		
		mov ah, 09h
		mov dx, offset Piqui
		int 21h
		
		; Obtener el codigo ASCII del caracter ingresado
		

		mov ah, 02 ; Imprime un caracter en pantalla
		mov dl, cl ; Mueve el caracter de cl a dl
		int 21h
		
		mov ah, 09
		mov dx, offset Fin
		int 21h
		
		mov ah, 08h		;Simula un Console.ReadKey()
		int 21h
		
		mov ax, 4c00h
		int 21h
	END inicio