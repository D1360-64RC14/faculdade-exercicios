programa {
	const inteiro LADOS = 3
	const inteiro QNT_JOGADORES = 2
	const caracter JOGADORES[QNT_JOGADORES][2] = { { 'A', 'X' }, { 'B', 'O' } } // linha: índice jogador; coluna: 0 (nome), 1 (simbolo)
	const inteiro J_NOME = 0
	const inteiro J_SIMBOLO = 1
	const caracter VAZIO = ' '
	
	caracter tabuleiro[LADOS][LADOS]
	inteiro coordenadasDaUltimaJogada[2] // 0 (linha), 1 (coluna)
	inteiro indiceDoJogadorAtual = 0
	inteiro numeroDaJogada = 1
	logico ultimaPosicaoEstavaInvalida = falso
	logico ultimaPosicaoEstavaOcupada = falso
	logico houveGanhador = falso

	funcao inicio() {
		preencherTabuleiroComVazios()

		enquanto (nao houveGanhador) {
			escreverTabuleiro()
			escreverMensagensDeErro()

			pedirPosicaoAoJogador(indiceDoJogadorAtual)
			verificarErros()

			se (nao haErros()) {
				prepararProximaJogada()
			}

			limpa()

			se (houveEmpate()) {
				pare
			}
		}

		escreverTabuleiro()

		se (houveGanhador) {
			escreva("\nParabéns jogador ", JOGADORES[indiceDoJogadorAtual][J_NOME], "! Você ganhou!")
		} senao {
			escreva("\nHouve empate!")
		}
	}

	funcao preencherTabuleiroComVazios() {
		para (inteiro linha = 0; linha < LADOS; linha++) {
			para (inteiro coluna = 0; coluna < LADOS; coluna++) {
				tabuleiro[linha][coluna] = ' '
			}
		}
	}

	funcao escreverTabuleiro() {
		inteiro linhaQ = 0
		
		para (inteiro linha = 0; linha < LADOS * 2 - 1; linha++) {
			se (linha % 2 == 0) {
				inteiro colunaQ = 0
				
				para (inteiro coluna = 0; coluna < LADOS * 2 - 1; coluna++) {
					se (coluna % 2 == 1) {
						escreva("|")
					} senao {
						escreva(tabuleiro[linhaQ][colunaQ])
						colunaQ++
					}
				}
			} senao {
				para (inteiro coluna = 0; coluna < LADOS * 2 - 1; coluna++) {
					se (coluna % 2 == 1) {
						escreva("+")
					} senao {
						escreva("-")
					}
				}

				linhaQ++
			}
			escreva("\n")
		}
	}

	funcao escreverMensagensDeErro() {
		se (ultimaPosicaoEstavaInvalida) {
			escreva("Posição inválida, informe novamente!\n")
		}
		se (ultimaPosicaoEstavaOcupada) {
			escreva("Posição já ocupada, tente novamente!\n")
		}
	}

	funcao pedirPosicaoAoJogador(inteiro indice) {
		escreva("Jogador ", JOGADORES[indice][J_NOME], " (", JOGADORES[indice][J_SIMBOLO], "), informe:\n")
		escreva("Linha: ")
		leia(coordenadasDaUltimaJogada[0])

		escreva("Coluna: ")
		leia(coordenadasDaUltimaJogada[1])
	}

	funcao verificarErros() {
		ultimaPosicaoEstavaInvalida = nao posicaoValida()

		se (nao ultimaPosicaoEstavaInvalida) {
			ultimaPosicaoEstavaOcupada = posicaoOcupada()
		} senao {
			ultimaPosicaoEstavaOcupada = falso
		}
	}

	funcao logico posicaoValida() {
		retorne nao (
			coordenadasDaUltimaJogada[0] < 0 ou coordenadasDaUltimaJogada[0] >= LADOS ou
			coordenadasDaUltimaJogada[1] < 0 ou coordenadasDaUltimaJogada[1] >= LADOS
		)
	}

	funcao logico posicaoOcupada() {
		retorne nao (tabuleiro[coordenadasDaUltimaJogada[0]][coordenadasDaUltimaJogada[1]] == VAZIO)
	}

	funcao logico haErros() {
		retorne ultimaPosicaoEstavaInvalida ou ultimaPosicaoEstavaOcupada
	}

	funcao prepararProximaJogada() {
		gravarPosicao(JOGADORES[indiceDoJogadorAtual][J_SIMBOLO])
		
		houveGanhador = jogadaGanhadora()

		se (nao houveGanhador) {
			proximoJogador()
			numeroDaJogada++
		}
	}

	funcao gravarPosicao(caracter simbolo) {
		tabuleiro[coordenadasDaUltimaJogada[0]][coordenadasDaUltimaJogada[1]] = simbolo
	}

	funcao proximoJogador() {
		indiceDoJogadorAtual = (indiceDoJogadorAtual + 1) % QNT_JOGADORES
	}

	funcao logico jogadaGanhadora() {
		para (inteiro linha = 0; linha < LADOS; linha++) {
			se (foiGanhadoraEmLinha(linha)) {
				retorne verdadeiro
			}
		}

		para (inteiro coluna = 0; coluna < LADOS; coluna++) {
			se (foiGanhadoraEmColuna(coluna)) {
				retorne verdadeiro
			}
		}

		se (foiGanhadoraEmDiagonais()) {
			retorne verdadeiro
		}

		retorne falso
	}

	funcao logico foiGanhadoraEmLinha(inteiro linha) {
		caracter exemplo = tabuleiro[linha][0]

		se (exemplo == VAZIO) {
			retorne falso
		}
		
		para (inteiro coluna = 0; coluna < LADOS; coluna++) {
			se (tabuleiro[linha][coluna] != exemplo) {
				retorne falso
			}
		}
		retorne verdadeiro
	}

	funcao logico foiGanhadoraEmColuna(inteiro coluna) {
		caracter exemplo = tabuleiro[0][coluna]

		se (exemplo == VAZIO) {
			retorne falso
		}
		
		para (inteiro linha = 0; linha < LADOS; linha++) {
			se (tabuleiro[linha][coluna] != exemplo) {
				retorne falso
			}
		}
		retorne verdadeiro
	}

	funcao logico foiGanhadoraEmDiagonais() {
		caracter exemploDiagonalPrincipal = tabuleiro[0][0]
		caracter exemploDiagonalSecundaria = tabuleiro[0][LADOS - 1]

		se (exemploDiagonalPrincipal == VAZIO ou exemploDiagonalSecundaria == VAZIO) {
			retorne falso
		}
		
		logico ganhadorEmPrincipal = verdadeiro
		logico ganhadorEmSecundaria = verdadeiro

		para (inteiro diPri = 0; diPri < LADOS; diPri++) {
			inteiro diSec = LADOS - 1 - diPri
			
			se (exemploDiagonalPrincipal != tabuleiro[diPri][diPri]) {
				ganhadorEmPrincipal = falso
			}
			se (exemploDiagonalSecundaria != tabuleiro[diSec][diSec]) {
				ganhadorEmSecundaria = falso
			}
		}

		retorne ganhadorEmPrincipal ou ganhadorEmSecundaria
	}

	funcao logico houveEmpate() {
		retorne numeroDaJogada > LADOS * LADOS
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3364; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */