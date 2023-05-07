programa {

	funcao inicio() {
		inteiro numeroInformado = pedirNumeroInteiro("Informe um número inteiro: ")

		limpa()
		mostreTabuadaDo(numeroInformado)
	}

	funcao inteiro pedirNumeroInteiro(cadeia pergunta) {
		inteiro resposta
		
		escreva(pergunta)
		leia(resposta)

		retorne resposta
	}

	funcao mostreTabuadaDo(inteiro numero) {
		escreva("--- Tabuada do ", numero, " ---\n")
		
		para (inteiro i = 0; i <= 10; i++) {
			escreva("  ", i, " * ", numero, " = ", numero * i, "\n")
		}

		escreva("\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 160; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */