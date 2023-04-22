programa {
	funcao inicio() {
		inteiro tamanho

		escreva("Informe a altura da escada: ")
		leia(tamanho)
		limpa()

		para (inteiro altura = tamanho; altura >= 1; altura--) {
			para (inteiro largura = altura - 1; largura >= 1; largura--) {
				escreva(" ")
			}
			para (inteiro largura = 0; largura <= tamanho - altura; largura++) {
				escreva("#")
			}
			escreva("\n")
		}
	}
}