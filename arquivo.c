#include <stdio.h>
#include <stdlib.h>

extern void cone(float*,float,float);


#define PI 3.14159265359
int main()
{
    double numero;
    printf("Digite um angulo: ");
    scanf(" %lf", &numero);


    numero = numero*(2*PI/360);

    double E;
    printf("Digite a diferença máxima entre o seno calculado e o seno real");
    scanf(" %lf", &E);

    printf("\nSeu angulo em radiano é : %0.11lf", numero);
    printf("\nA diferença máxima é : %0.11lf\n", E);
    return 0;
}