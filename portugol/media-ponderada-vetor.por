programa {
	funcao inicio() {
		const inteiro quantidade = 10

		inteiro numeros[quantidade]
		real mediaSomatoria = 0.0
		real dividendoSomatoria = 0.0
		real media

		escreva("Informe os números:\n")

		para (inteiro i = 0; i < quantidade; i++) {
			escreva(i + 1, "º: ")
			leia(numeros[i])

			mediaSomatoria += numeros[i] * i
			dividendoSomatoria += i
		}

		limpa()

		media = mediaSomatoria / dividendoSomatoria

		escreva("Os números digitados foram:\n")

		para (inteiro i = 0; i < quantidade; i++) {
			escreva("  ", numeros[i], "\n")
		}

		escreva("E a média ponderada é ", media)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 366; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */