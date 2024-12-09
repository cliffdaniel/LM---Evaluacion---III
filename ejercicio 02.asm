.ORG 8000H         ; Punto de inicio del programa en 8000H

MVI C, 18H         ; XXH (límite superior en hexadecimal)
MVI B, 00H         ; Inicio de la cuenta en 00H

ASCENDENTE:        
    MOV A, B        ; Cargar el valor de B en el acumulador
    OUT 00H         ; Enviar el valor al puerto 00H conectado al display
    CALL DELAY      ; Llamar a la rutina de retardo
    INR B           ; Incrementar B
    CMP C           ; Comparar B con el límite superior (C)
    JZ DESCENDENTE  ; Si alcanza el límite, saltar a la cuenta descendente
    JMP ASCENDENTE  ; Continuar con la cuenta ascendente

DESCENDENTE:        
    MOV A, B        ; Cargar el valor de B en el acumulador
    OUT 00H         ; Enviar el valor al puerto 00H conectado al display
    CALL DELAY      ; Llamar a la rutina de retardo
    DCR B           ; Decrementar B
    JNZ DESCENDENTE ; Continuar mientras B no sea 00H
    JMP ASCENDENTE  ; Reiniciar la cuenta ascendente

; Rutina de retardo
DELAY:
    MVI D, 0FFH     ; Cargar un valor alto para el retardo
DELAY_LOOP1:
    MVI E, 0FFH     ; Cargar un valor alto para el retardo
DELAY_LOOP2:
    NOP             ; No operación (genera retardo)
    DCR E           ; Decrementar E
    JNZ DELAY_LOOP2 ; Repetir hasta que E sea 0
    DCR D           ; Decrementar D
    JNZ DELAY_LOOP1 ; Repetir hasta que D sea 0
    RET             ; Retornar al programa principal

HLT                 ; Detener el programa

