#include <stdio.h>
#include <stdlib.h>

//nasm -f elf ap5_a.asm
//gcc -o -m32 programa arquivo.c codigo.o

#define pi 3.14159265359

extern void calcula_seno(float*, float, float);

double to_rad(double number){
    double aux;
    aux = number*2*pi/360;
    return aux;
}
double main_menu_1(){
	double aux;
	printf("\n\n||===CALCULADORA PRO-2000===||\n\n");
	printf("Esse programa irá calcular o valor\ndo seno de um angulo escolhido por você\natraves de um código assembly.\n\n");
	printf("Insira o valor do angulo, em graus: ");
	scanf("%lf", &aux);
	aux = to_rad(aux);
	return aux;
}
void bn(){
	printf("\n");
}
double main_menu_2(){
	double aux;
	printf("Agora insira o erro do calculo: ");
	scanf("%lf", &aux);
	return aux;
}

int main(){
	double angle, error;
	angle = main_menu_1();
	bn();
	error = main_menu_2();
	calcula_seno(&resultado, x, erro)

    return 0;
}