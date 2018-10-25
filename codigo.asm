extern printf; a função C chamada
;w = 16 bits
;dw = 32
;qw =64

SECTION .data

msg db "O valor é: %.14f",0x0a,0x00
msgST0 db "    O St0 é: %.14f",0x0a,0x00
msgInteracao db "    Interacao  é: %.14f",0x0a,0x00
raio dq 2.0
altura dq 1.57079632

SECTION .bss
vol resq 1
numerador resq 1
denominador resq 1
resultadoSeno resq 1
temp resq 1

SECTION .text


printar:
    pusha
    push dword [vol+4]
    push dword [vol]
    push dword msg
    call printf
    add esp, 12 ;altera o valor da pilha para a rotina poder voltar pra main com sucesso
    popa
    ret


printarST0:
    pusha
    push dword [vol+4]
    push dword [vol]
    push dword msgST0
    call printf
    add esp, 12 ;altera o valor da pilha para a rotina poder voltar pra main com sucesso
    popa
    ret

printarInteeracao:
    pusha
    push dword [vol+4]
    push dword [vol]
    push dword msgInteracao
    call printf
    add esp, 12 ;altera o valor da pilha para a rotina poder voltar pra main com sucesso
    popa
    ret


;
;Situação da Pilha
;double é 64 bits
;float é 32 bits
;                       Pos MEmoria(inventei para fins didáticos)
;   E                   34520 ----> EBP + 24
;   angulo              34516 ----> EBP+16
;   numeroInteraçao     34512 ----> EBP+8
;   Return Adress       34508 ----> possui 64 bits  
;   SalvaEBP            34504 ---->O novo EBP está apontando para essa posição e o EBP antigo esta guardado nessa posição

;Funcionamento da pilha
;   Argumento1
;   Argumento2
;   Argumento3
;   Return Adress------>possui 64 bits
;   Salva EBP
;   Variaveis Locais1   NAo estamos usando
;   Variaveis Locais2   NAo estamos usando
;   Variaveis Locais3   NAo estamos usando


;st0^eax com eax !=0
potencia:
    fld1
    ;atualmente st0 =1 st1 = angulo
    fmul st0,st1
    ;atualmente st0 = angulo st1 = angulo



    

    pot:
        cmp eax,1
        je fimPot
        sub eax,1
        fmul st0,st1; 


   


        jmp pot
        
    fimPot:
    fst qword[numerador] ; empilha o numerador
    finit
    ret

;eax! com eax != 0
fatorial:
    mov [temp],eax
    fild qword[temp] 
    ;atualmente st0 = eax

    
        

    fat:
        cmp eax,1
        je fimFat
        
        sub eax,1
        mov [temp],eax
        fild qword[temp] 
        ;atualmente st0 = eax-1         st1 = eax
        fmulp st1,st0
        ;atualmente  st0 = (eax-1)*eax
        
        
        
        jmp fat
    fimFat:
    fst qword[denominador] ; empilha o numerador
    finit
    ret
        


global calculaSeno
calculaSeno:
    enter 0, 0    
    ;fld qword[ebp + 24] ; empilha numInt
    ;fld qword[ebp + 16] ; empilha E
    ;fld qword[ebp + 8] ; empilha angulo


    mov ecx,0
    mov eax,0
    
    
    seno:
        pusha 
        
        
        finit

        fld qword[ebp + 8] ; empilha angulo
        

        
        
        imul ax,cx,2    
        inc ax
        call potencia

        imul ax,cx,2    
        inc ax
        
        call fatorial

        fld qword[denominador]
        ;atualmente st0= denominador
        fld qword[numerador]
        ;atualmente st0= numerador    st1= denominador

        fdiv st0,st1
        ;atualmente st0= numerador/denominador    st1= denominador

        ;divide dx Uniao ax por 2
        ;passando bx pra ax e dx para zero
        mov edx,0
        
        mov ax,cx
        ;divide por 2 coloca resto em dx e quociente em ax
        mov ebx,2
        div bx
        cmp dx,0;comparando o resto com zero
        ;;;;;;;;;;;;;;
        je par 
        fchs;inverte sinal de st0
        par:
        fld qword[resultadoSeno] ; empilha o resultadoSeno
        ;atualmente st0 = resultadoseno       st1= +-numerador/denominador              st2= denominador
        
        fadd st0,st1
        ;atualmente st0=   resultadoSeno +- numerado/denominador     st1= numerador/denominador              st2= denominador
        fst qword[resultadoSeno]

        fld qword[ebp + 8] ; empilha angulo
        ;atualmente st0 = angulo           st1=   resultadoSeno + numerado/denominador     st2= numerador/denominador              st3= denominador
        fsin 
        ;atualmente st0 = sin(angulo)       st1=   resultadoSeno + numerado/denominador     st2= numerador/denominador              st3= denominador
        fsub st0,st1
        fabs
        ;atualmente st0 = |sin(angulo) - resultado/denominador|      st1=   resultadoSeno + numerado/denominador     st2= numerador/denominador              st3= denominador
        fld qword[ebp + 16];
        ;atualmente st0 = E                  st1 = |sin(angulo) - resultado/denominador|      st2=   resultadoSeno + numerado/denominador     st3= numerador/denominador              st4= denominador
        
        fxch st1

        ;fst qword[vol] ; armazena na memoria
        ;call printarST0

        popa 
        inc cx
        fcomi
        ja seno
                

        fxch st2
        ;atualmente st0 = resultadoSeno + numerado/denominador     st1 = |sin(angulo) - resultado/denominador|     st2=   E    st3= numerador/denominador              st4= denominador
        

        

        mov [temp],ecx
        fild qword[temp] 
        ;atualmente st0 = ecx         st1 = resultadoSeno + numerado/denominador     st2 = |sin(angulo) - resultado/denominador|   
        ;  st3=   E                   st4= numerador/denominador              st5= denominador

        ;passar para memoria(ponteiro)
        mov eax,[ebp + 24]
        fist dword[eax];converte de ponto flutuante para inteiro e passa para  a memorias
        



        fxch
        ;atualmente  st0 = resultadoSeno + numerado/denominador   st1 = ecx      st2 = |sin(angulo) - resultado/denominador|   
        ;  st3=   E                   st4= numerador/denominador              st5= denominador

        
        ;retorna   st0 = resultadoSeno + numerado/denominador
        
        
        

        
        
        leave
        ret
