programa {
	funcao inicio() {
		const inteiro quantidadeNumeros = 10

		real acumuladorMedia = 0.0
		real numeros[quantidadeNumeros]

		para (inteiro i = 0; i < quantidadeNumeros; i++) {
			escreva("Informe o ", i + 1, "º numero: ")
			leia(numeros[i])
			acumuladorMedia += numeros[i]
		}

		limpa()

		escreva("Os numeros informados foram:\n")

		para (inteiro i = quantidadeNumeros - 1; i >= 0; i--) {
			escreva("  ", numeros[i], "\n")
		}

		real media = acumuladorMedia / quantidadeNumeros
		
		escreva("A média deles é ", media, "\n")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 289; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */