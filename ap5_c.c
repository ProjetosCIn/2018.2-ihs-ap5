#include <stdio.h>
#include <stdlib.h>

//nasm -f elf ap5_a.asm
//gcc -o -m32 programa arquivo.c codigo.o

#define pi 3.14159265359

extern void cone(float*, float, float);

double to_rad(double number){
    double aux;
    aux = number*2*pi/360;
    return aux;
}

int main(){
    double angle;
    printf("Insira o valor do angulo, em graus: ");
    scanf("%lf", angle);
    printf("\n");
    printf("O seu número em radianos é: %lf\n", aux);

    return 0;
}