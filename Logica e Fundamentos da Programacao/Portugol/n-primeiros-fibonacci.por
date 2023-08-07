programa {
	funcao inicio() {
		inteiro maximo
		
		escreva("Informe a quantidade de números que você deseja: ")
		leia(maximo)

		limpa()

		se (maximo <= 0) {
			escreva("O número informado deve ser maior que 0!")
		} senao {
			inteiro fibPenultimo = 0, fibUltimo = 1

			escreva("Os ", maximo, " primeiros dígitos da sequência de Fibonacci são:\n")
			
			para (inteiro i = 0; i < maximo; i++) {
				escreva("  ", fibUltimo, "\n")
				
				fibUltimo = fibPenultimo + fibUltimo
				fibPenultimo = fibUltimo - fibPenultimo
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 544; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */