programa
{
	
	funcao inicio()
	{
		// Escreva um algoritmo que calcule e imprima o
		// produto dos números ímpares de 1 a 20.

		const inteiro fim = 20

		inteiro produto = 1

		para (inteiro i = 1; i <= fim; i += 2) {
			produto *= i
		}

		escreva("O produto dos ímpares de 0 até ", fim, " é ", produto)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 259; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
