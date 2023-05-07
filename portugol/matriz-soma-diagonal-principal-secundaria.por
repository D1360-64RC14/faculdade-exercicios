// Soma da diagonal principal e secundaria

programa {
	funcao inicio() {
		inteiro matriz[3][3] = {
			{ 3, 1, 4 },
			{ 0, 2, 1 },
			{ 2, 3, 5 }
		}

		inteiro somaPrincipal = somaDiagonalPrincipal(matriz, 3)
		inteiro somaSecundaria = somaDiagonalSecundaria(matriz, 3)

		escreva("Soma da principal: ", somaPrincipal, "\n")
		escreva("Soma da secundaria: ", somaSecundaria)
	}

	funcao inteiro somaDiagonalPrincipal(inteiro matrix[][], inteiro tamanho) {
		inteiro somatoria = 0
		
		para (inteiro i = 0; i < tamanho; i++) {
			somatoria += matrix[i][i]
		}

		retorne somatoria
	}

	funcao inteiro somaDiagonalSecundaria(inteiro matrix[][], inteiro tamanho) {
		inteiro somatoria = 0
		
		para (inteiro i = 0; i < tamanho; i++) {
			somatoria += matrix[i][tamanho - 1 - i]
		}

		retorne somatoria
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 154; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {i, 31, 16, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */