programa
{
	
	funcao inicio()
	{
		// Escreva um algoritmo que calcule e imprima a soma dos
		// primeiros N números naturais (onde N é escolhido pelo usuário).

		inteiro qntInformada
		inteiro soma = 0

		escreva("Informe a quantidade de números para somar: ")
		leia(qntInformada)

		para (inteiro i = 1; i <= qntInformada; i++) {
			soma += i
		}

		escreva("Sua somatória é ", soma)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 348; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
