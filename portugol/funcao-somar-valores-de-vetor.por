programa {
	
	funcao inicio() {
		inteiro sequenciaCrescente[5] = { 1, 2, 3, 4, 5 }
		inteiro primos[5] = { 2, 3, 5, 7, 11 }
		inteiro sequenciaDecescente[5] = { -1, -2, -3, -4, -5 }
		inteiro fibonacci[5] = { 1, 1, 2, 3, 5 }

		escreva("sequenciaCrescente: ", somaDoVetor(sequenciaCrescente, 5), "\n")
		escreva("primos: ", somaDoVetor(primos, 5), "\n")
		escreva("sequenciaDecescente: ", somaDoVetor(sequenciaDecescente, 5), "\n")
		escreva("fibonacci: ", somaDoVetor(fibonacci, 5), "\n")
		
	}

	funcao inteiro somaDoVetor(inteiro numeros[], inteiro tamanho) {
		inteiro soma = 0

		para (inteiro i = 0; i < tamanho; i++) {
			soma += numeros[i]
		}

		retorne soma
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 501; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */