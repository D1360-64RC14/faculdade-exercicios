programa
{
	
	funcao inicio()
	{
		inteiro tabuada

		escreva("Informe de qual número você deseja a tabuada: ")
		leia(tabuada)

		limpa()
		escreva("A tabuada do ", tabuada, " é:\n")

		inteiro indice = 0
		enquanto (indice <= 10) {
			inteiro resultado = tabuada * indice
			
			escreva("  ", tabuada, " * ", indice, " = ", resultado, "\n")
			indice++
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 32; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */