#include <stdio.h>
#include <stdlib.h>

extern void calculaSeno(double,double,int*);//(valor de x em rad, valor da diferença e qtd de iteraçoes)
//a função retorna o valor calculado para sin x


#define PI 3.14159265359
int main()
{
    double angulo;
    printf("Digite um angulo: ");
    scanf(" %lf", &angulo);


    angulo = angulo*(2*PI/360);

    double E;
    printf("Digite a diferença máxima entre o seno calculado e o seno real");
    scanf(" %lf", &E);

    int* numeroIteracao;
    //calculaSeno(angulo,E,numeroIteracao);

    printf("\nSeu angulo em radiano é : %0.11lf", angulo);
    printf("\nA diferença máxima é : %0.11lf\n", E);
    return 0;
}
