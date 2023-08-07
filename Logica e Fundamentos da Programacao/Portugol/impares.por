programa
{
	
	funcao inicio()
	{
		inteiro numeroInformado

		escreva("Informe um número inteiro: ")
		leia(numeroInformado)

		limpa()
		escreva("Os números ímpares entre 1 e ", numeroInformado, " são:\n")
		
		para (inteiro impares = 1; impares <= numeroInformado; impares += 2) {
			escreva("  ", impares, "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 330; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */