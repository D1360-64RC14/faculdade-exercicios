programa
{
	funcao inicio()
	{
		// Quadrados perfeitos e A a B
	
		inteiro primeiro
		escreva("Informe o número A: ")
		leia(primeiro)

		inteiro segundo
		escreva("Informe o número B: ")
		leia(segundo)

		limpa()

		se (primeiro > segundo) {
			escreva("O valor de A deve ser menor que o de B!")
		} senao {
			logico naoHaNumeros = verdadeiro
	
			escreva("Os números quadrados entre ", primeiro, " e ", segundo, " são:\n")
			para (inteiro i = primeiro; i <= segundo; i++) {
				logico quadrado = falso
	
				para (inteiro j = 0; j <= i; j++) {
					se (j * j == i e i != 0) {
						quadrado = verdadeiro
					}
				}
	
				se (quadrado) {
					naoHaNumeros = falso
					escreva("    ", i, "\n")
				}
			}
	
			se (naoHaNumeros) {
				escreva("Não há números quadrados :(")
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 209; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {primeiro, 7, 10, 8}-{segundo, 11, 10, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */