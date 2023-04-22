programa {
	funcao inicio() {
		inteiro tamanho

		escreva("Informe a altura da escada: ")
		leia(tamanho)
		limpa()

		para (inteiro altura = 1; altura <= tamanho; altura++) {
			para (inteiro largura = tamanho; largura >= 1; largura--) {
				se (altura < largura) {
					escreva(" ")
				} senao {
					escreva("#")
				}
			}
			escreva("\n")
		}
	}
}