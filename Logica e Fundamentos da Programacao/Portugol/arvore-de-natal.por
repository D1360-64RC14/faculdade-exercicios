programa {
	funcao inicio() {
		inteiro tamanho

		escreva("Informe a altura da árvore de natal: ")
		leia(tamanho)
		limpa()
		
		para (inteiro estrelaEspaco = 1; estrelaEspaco <= tamanho - 1; estrelaEspaco++) {
			escreva(" ")
		}
		escreva("*\n")
		
		para (inteiro altura = tamanho; altura >= 1; altura--) {
			para (inteiro largura = altura - 1; largura >= 1; largura--) {
				escreva(" ")
			}
			para (inteiro largura = 0; largura <= (tamanho - altura)*2; largura++) {
				escreva("#")
			}
			escreva("\n")
		}
		
		para (inteiro cauleEspaco = 1; cauleEspaco <= tamanho - 1; cauleEspaco++) {
			escreva(" ")
		}
		escreva("|\n")
	}
}