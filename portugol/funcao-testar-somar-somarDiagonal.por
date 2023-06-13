programa
{
	
	funcao inicio()
	{
		inteiro sequenciaCrescente[5] = { 1, 2, 3, 4, 5 }
		inteiro primos[11] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31 }
		inteiro sequenciaDecescente[3] = { -1, -2, -3 }
		inteiro fibonacci[8] = { 1, 1, 2, 3, 5, 8, 13, 21 }

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
		escreva("\n")

		// sequenciaCrescente
		testarSeNumeroExiste(4, sequenciaCrescente, 5)
		testarSeNumeroExiste(5, sequenciaCrescente, 5)
		testarSeNumeroExiste(6, sequenciaCrescente, 5)
		
		realizarSomaDoVetor(sequenciaCrescente, 5)
		escreva("\n")

		// primos
		testarSeNumeroExiste(2, primos, 11)
		testarSeNumeroExiste(10, primos, 11)
		testarSeNumeroExiste(23, primos, 11)

		realizarSomaDoVetor(primos, 11)
		escreva("\n")

		// sequenciaDecescente
		testarSeNumeroExiste(-1, sequenciaDecescente, 3)
		testarSeNumeroExiste(0, sequenciaDecescente, 3)
		testarSeNumeroExiste(1, sequenciaDecescente, 3)

		realizarSomaDoVetor(sequenciaDecescente, 3)
		escreva("\n")

		// fibonacci
		testarSeNumeroExiste(5, fibonacci, 8)
		testarSeNumeroExiste(6, fibonacci, 8)
		testarSeNumeroExiste(7, fibonacci, 8)
		
		realizarSomaDoVetor(fibonacci, 8)
	}

	funcao testarSeNumeroExiste(inteiro numero, inteiro vetor[], inteiro tamanho) {
		logico numeroExiste = inteiroExisteEmVetor(numero, vetor, tamanho)
	
		escreva("O numero ", numero, " existe no vetor? ", numeroExiste, "\n")
	}

	funcao logico inteiroExisteEmVetor(inteiro numero, inteiro vetor[], inteiro tamanho) {
		para (inteiro i = 0; i < tamanho; i++) {
			se (vetor[i] == numero) {
				retorne verdadeiro
			}
		}

		retorne falso
	}

	funcao realizarSomaDoVetor(inteiro vetor[], inteiro tamanho) {
		inteiro soma = somaDoVetor(vetor, tamanho)

		escreva("A soma do vetor é ", soma, "\n")
	}

	funcao inteiro somaDoVetor(inteiro vetor[], inteiro tamanho) {
		inteiro soma = 0

		para (inteiro i = 0; i < tamanho; i++) {
			soma += vetor[i]
		}

		retorne soma
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
 * @POSICAO-CURSOR = 523; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */