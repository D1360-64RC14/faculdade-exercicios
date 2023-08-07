programa
{
	
	funcao inicio()
	{
		inteiro numeroInformado

		escreva("Informe um número inteiro: ")
		leia(numeroInformado)

		limpa()

		escreva("A sequência é:\n")

		inteiro indice = 0
		faca {
			escreva("  ", indice, "\n")
			
			indice++
		} enquanto (indice <= numeroInformado)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 15; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */