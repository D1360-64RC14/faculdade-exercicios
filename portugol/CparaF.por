programa
{
	inclua biblioteca Matematica --> mat
	
	funcao inicio()
	{
		// pega em C e manda pra F
		real temperaturaC
		real temperaturaF

		escreva("Informe sua temperatura em graus Celsius: ")
		leia(temperaturaC)

		temperaturaF = mat.arredondar(9.0/5.0 * temperaturaC + 32, 1)

		escreva("Sua temperatura em graus Fahrenheit: ", temperaturaF)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 102; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */