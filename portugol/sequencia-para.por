programa
{
	
	funcao inicio()
	{
		inteiro numeroInformado

		escreva("Informe um número inteiro: ")
		leia(numeroInformado)

		limpa()

		escreva("A sequência é:\n")

		para (inteiro indice = 0; indice <= numeroInformado; indice++) {
			escreva("  ", indice, "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 270; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */