programa {
	funcao inicio() {
		const inteiro quantidadeNomes = 5

		cadeia nomes[quantidadeNomes]

		para (inteiro i = 0; i < quantidadeNomes; i++) {
			escreva("Informe o ", i + 1, "º nome: ")
			leia(nomes[i])
		}

		limpa()

		escreva("Os nomes informados foram:\n")

		para (inteiro i = quantidadeNomes - 1; i >= 0; i--) {
			escreva("  ", i + 1, ". ", nomes[i], "\n")
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 383; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */