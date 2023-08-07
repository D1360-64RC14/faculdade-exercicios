programa
{
	inclua biblioteca Matematica --> mat

	funcao inicio()
	{
		// recebe valor de conta de restauirante e calcule com 10% de desconto

		real valorDaConta
		real valorComAcrescimo
		real acrescimo

		escreva("Informe o valor de sua conta: ")
		leia(valorDaConta)

		acrescimo = mat.arredondar(valorDaConta * 0.1, 2)
		valorComAcrescimo = acrescimo + valorDaConta

		escreva("Seu valor com desconto é ", valorComAcrescimo)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 146; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */