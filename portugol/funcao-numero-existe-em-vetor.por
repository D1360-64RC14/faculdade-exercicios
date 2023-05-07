programa
{
	
	funcao inicio()
	{
		inteiro fibonacci[10] = { 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 }
		inteiro primos[10] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 }

		testarSeNumeroExiste(5, fibonacci, 10)
		testarSeNumeroExiste(6, fibonacci, 10)
		testarSeNumeroExiste(7, fibonacci, 10)

		escreva("\n")
		
		testarSeNumeroExiste(2, primos, 10)
		testarSeNumeroExiste(10, primos, 10)
		testarSeNumeroExiste(23, primos, 10)
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
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 287; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */