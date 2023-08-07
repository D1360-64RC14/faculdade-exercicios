programa
{
	
	funcao inicio()
	{
		inteiro tabuada, inicial, final
		
		escreva("Informe de qual número você deseja a tabuada: ")
		leia(tabuada)

		escreva("Informe de qual número você deseja que a tabuada seja iniciada: ")
		leia(inicial)

		escreva("Informe o número final da tabuada: ")
		leia(final)

		limpa()
		escreva("A tabuada do ", tabuada, " é:\n")
		
		se (inicial > final) {
			inteiro intermedio = inicial
			inicial = final
			final = intermedio
		}

		para (inteiro i = inicial; i <= final; i++) {
			inteiro resultado = tabuada * i
			
			escreva("  ", tabuada, " * ", i, " = ", resultado, "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 310; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */