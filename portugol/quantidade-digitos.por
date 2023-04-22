programa
{
	
	funcao inicio()
	{
		inteiro numeroInformado

		escreva("Informe um número inteiro: ")
		leia(numeroInformado)

		inteiro quantidadeDeDigitos = 0

		enquanto (numeroInformado > 0) {
			quantidadeDeDigitos++
			numeroInformado = numeroInformado / 10
		}

		escreva("Seu número possui ", quantidadeDeDigitos, " dígitos")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 344; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */