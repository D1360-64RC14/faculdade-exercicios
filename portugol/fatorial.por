programa
{
	
	funcao inicio()
	{
		// Fatorial

		inteiro numero
		escreva("Informe um número para calcular o fatorial: ")
		leia(numero)

		limpa()
		
		logico negativo = falso
		se (numero < 0) {
			numero *= -1
			negativo = verdadeiro
		}

		inteiro fatorial = 1

		se (fatorial != 0) {
			para (inteiro i = numero; i >= 1; i--) {
				fatorial *= i
			}
		}

		se (negativo) {
			fatorial *= -1
			numero *= -1
		}

		se (fatorial == 0) {
			escreva("O fatorial de ", numero, " é tão grande que não posso calcular!")
		} senao {
			escreva("O fatorial de ", numero, " é ", fatorial)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 143; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {numero, 8, 10, 6}-{fatorial, 20, 10, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */