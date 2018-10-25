#include <stdio.h>
#include <stdlib.h>

extern double calculaSeno(double,double,int*);//(valor de x em rad, valor da diferença e qtd de iteraçoes)
//a função retorna o valor calculado para sin x


#define PI 3.14159265359
int main()
{
    double angulo;
    printf("Digite um angulo: ");
    scanf(" %lf", &angulo);


    angulo = angulo*(2*PI/360);

    double E;
    printf("Digite a diferença máxima entre o seno calculado e o seno real: ");
    scanf(" %lf", &E);

    int numeroIteracao;
    
    double sinX;
    
    sinX = calculaSeno(angulo,E,&numeroIteracao);

    printf("O valor de sin foi: %.14lf \n",sinX);


    printf("O num de interacoes foi: %d \n",numeroIteracao);
    
    return 0;
}
