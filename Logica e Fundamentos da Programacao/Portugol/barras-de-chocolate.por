programa {
	funcao inicio() {
		inteiro dinheiro = 15
		inteiro custoPorBarra = 3
		inteiro cortePromocao = 2

		escreva("Informe quantos dinheiros você tem: ")
		leia(dinheiro)

		escreva("Informe quanto custa cada barra de chocolate: ")
		leia(custoPorBarra)

		escreva("Informe quantas embalagens você pode trocar pro outra barra: ")
		leia(cortePromocao)

		limpa()
		se (dinheiro < 0 ou custoPorBarra < 0) {
			escreva("Você não pode inserir valores monetários negativos!")
		} senao
		se (custoPorBarra < 1) {
			escreva("A barra não pode ser vendida de graça!")
		} senao
		se (dinheiro < custoPorBarra) {
			escreva("Oops, você não tem dinheiro suficiente para comprar barras :(")
		} senao
		se (cortePromocao < 2) {
			escreva("A quantidade de embalagens da promoção deve ser maior que 1, senão você poderá trocar infinitas barras!")
		} senao {
			inteiro barrasComidas = 0

			inteiro embalagensRestantes = dinheiro / custoPorBarra
			barrasComidas += embalagensRestantes
	
			enquanto (embalagensRestantes >= cortePromocao) {
				inteiro novasPorPromocao = embalagensRestantes / cortePromocao
				embalagensRestantes -= novasPorPromocao * cortePromocao
				
				barrasComidas += novasPorPromocao
				embalagensRestantes += novasPorPromocao
			}
	
			escreva("Você poderá comer ", barrasComidas, " barras de chocolate.")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1174; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */