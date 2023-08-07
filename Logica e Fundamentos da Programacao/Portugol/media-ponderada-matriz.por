programa {
	funcao inicio() {
		const inteiro quantidade = 10

		// 0 (valor); 1 (peso); 2 (valor pesado)
		real numeros[quantidade][3]
		real mediaSomatoria = 0.0
		real dividendoSomatoria = 0.0
		
		escreva("Informe os números:\n")

		para (inteiro i = 0; i < quantidade; i++) {
			real entrada
			
			escreva(i + 1, "º: ")
			leia(entrada)

			numeros[i][0] = entrada
			numeros[i][1] = i
			numeros[i][2] = entrada * i

			mediaSomatoria += numeros[i][2]
			dividendoSomatoria += numeros[i][1]
		}

		limpa()

		escreva("Valor, Peso, Valor Pesado:\n")
		
		para (inteiro i = 0; i < quantidade; i++) {
			escreva("  ", numeros[i][0], ", ", numeros[i][1], ", ", numeros[i][2], "\n")
		}

		escreva("A média ponderada é ", mediaSomatoria / dividendoSomatoria)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 506; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */