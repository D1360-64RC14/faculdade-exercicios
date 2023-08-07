programa
{
	
	funcao inicio()
	{
		inteiro quantidadeDeMedia
		real acumulador = 0.0
		real media

		escreva("Informe a quantidade de números você deseja tirar a média: ")
		leia(quantidadeDeMedia)

		para (inteiro indice = 0; indice < quantidadeDeMedia; indice++) {
			inteiro informado
			
			escreva("Informe seu inteiro: ")
			leia(informado)

			acumulador = acumulador + informado
		}

		limpa()

		media = acumulador / quantidadeDeMedia
		escreva("A média de seus números é ", media)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 396; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */