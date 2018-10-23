
extern printf; a função C chamada

SECTION .data

msg db "O valor é: %.3f",0x0a,0x00
raio dq 2.0
altura dq 3.0

SECTION .bss
vol resq 1

SECTION .text



printar:
push dword [vol+4]
push dword [vol]
push dword msg
call printf
ret




global cone
cone:
enter 0, 0
fldpi
; empilha PI
fld qword[raio] ; empilha o raio
fmul st0,st0 ; calcula e empilha raio^2
fmul st0,st1; calcula e empilha PI * raio^2
fld qword[altura] ; empilha altura
fmul st0,st1 ; calcula o volume do cilindro
fst qword[vol] ; armazena na memoria

call printar


; push dword [vol+4]
; push dword [vol]
; push dword msg
; call printf
leave
ret

