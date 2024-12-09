.ORG 2000H          ; Inicio del programa en la dirección 2000H

    ; Paso 1: Cargar los códigos de segmentos en memoria (3000H - 3009H)
    LXI H, 3000H        ; Cargar la dirección inicial de la tabla en HL

    MVI A, 3FH          ; Código para el número 0
    MOV M, A            ; Guardar en la dirección apuntada por HL
    INX H               ; Incrementar HL para pasar a la siguiente dirección

    MVI A, 06H          ; Código para el número 1
    MOV M, A
    INX H

    MVI A, 5BH          ; Código para el número 2
    MOV M, A
    INX H

    MVI A, 4FH          ; Código para el número 3
    MOV M, A
    INX H

    MVI A, 66H          ; Código para el número 4
    MOV M, A
    INX H

    MVI A, 6DH          ; Código para el número 5
    MOV M, A
    INX H

    MVI A, 7DH          ; Código para el número 6
    MOV M, A
    INX H

    MVI A, 07H          ; Código para el número 7
    MOV M, A
    INX H

    MVI A, 7FH          ; Código para el número 8
    MOV M, A
    INX H

    MVI A, 6FH          ; Código para el número 9
    MOV M, A

    ; Paso 2: Encontrar el mayor número en la tabla (3000H - 3009H)
    LXI H, 3000H        ; Cargar la dirección inicial de la tabla en HL
    MVI C, 0AH          ; Número de elementos en la tabla (10)
    MOV A, M            ; Cargar el primer número de la tabla en A
    INX H               ; Incrementar HL para apuntar al siguiente número
    DCR C               ; Decrementar el contador porque ya procesamos el primer número

FIND_MAX:
    CMP M               ; Comparar el contenido de A con el valor en M
    JC SKIP             ; Si A es mayor, saltar
    MOV A, M            ; Si el valor en memoria es mayor, cargarlo en A

SKIP:
    INX H               ; Incrementar HL para apuntar al siguiente número
    DCR C               ; Decrementar el contador
    JNZ FIND_MAX        ; Repetir mientras el contador no sea cero

    ; Paso 3: Mostrar el mayor número en el display
    OUT 00H             ; Enviar el contenido de A al puerto 00H
    HLT                 ; Detener el programa

