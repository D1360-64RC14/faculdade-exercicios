programa
{
	
	funcao inicio()
	{
		inteiro sequencias1[3][3] = {
			{ 2, 3, 5 },
			{ -1, -2, -3 },
			{ 1, 1, 2 }
		}
		inteiro sequencias2[3][3] = {
			{ 7, 11, 13 },
			{ 1, 2, 3 },
			{ 3, 5, 8 }
		}

		realizarSomaDaDiagonal(sequencias1, 3)
		realizarSomaDaDiagonal(sequencias2, 3)
	}

	funcao realizarSomaDaDiagonal(inteiro matriz[][], inteiro tamanho) {
		inteiro soma = somaDiagonalPrincipalMatriz(matriz, tamanho)

		escreva("A soma dadiagonal principal é ", soma, "\n")
	}

	funcao inteiro somaDiagonalPrincipalMatriz(inteiro matriz[][], inteiro tamanho) {
		inteiro soma = 0

		para (inteiro i = 0; i < tamanho; i++) {
			soma += matriz[i][i]
		}

		retorne soma
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 291; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */