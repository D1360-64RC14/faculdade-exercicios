/**
 * ## Grupo
 * 
 * |  RA  |       Nome      |
 * | ---- | --------------- |
 * | 1424 | Diego Garcia    |
 * | 1572 | Alexandre Rossi |
 */

programa {
	inclua biblioteca Matematica --> mat

	const caracter CAT_PROMOTOR = 'P'
	const caracter CAT_NEUTRO = 'N'
	const caracter CAT_DETRATOR = 'D'

	inteiro entradas = 0
	inteiro detratores = 0
	inteiro neutros = 0
	inteiro promotores = 0

	funcao inicio() {
		inteiro populacao = 0
		
		apresentacao()

		enquanto (verdadeiro) {
			populacao = pedirPopulacao()

			logico populacaoEhValida = populacao > 0
			se (populacaoEhValida) pare

			apresentacaoComErro("Erro: a quantidade de entradas deve ser maior que 0")
		}

		apresentacao()
		
		inteiro nth = 1
		enquanto (nth <= populacao) {
			escreverQuantidades(verdadeiro)
			
			escreverNPS()
			escreverZona()

			escreva("\n")
			inteiro nota = pedirNota(nth, populacao)

			logico notaEhValida = nota >= 0 e nota <= 10
			se (notaEhValida) {
				computarNota(nota)
				nth++
				apresentacao()
			} senao {
				apresentacaoComErro("Erro: a nota deve estar num intervalo entre 0 e 10")
			}
		}

		apresentacao()

		escreverQuantidades(falso)
		
		escreverNPS()
		escreverZona()
	}

	funcao apresentacao() {
		limpa()
		
		escreva("----------------------------\n")
		escreva("       Cálculo de NPS       \n")
		escreva("----------------------------\n\n")
	}
	funcao apresentacaoComErro(cadeia erro) {
		apresentacao()

		escreva(erro, "\n\n")
	}

	funcao inteiro pedirPopulacao() {
		inteiro populacao
		
		escreva("Informe a quantidade de entradas: ")
		leia(populacao)

		retorne populacao
	}

	funcao escreverZona() {
		se (nao contemValores()) {
			escreva("Zona Atual: --\n")
			retorne
		}
		
		cadeia zona = identificarZona()
		escreva("Zona Atual: ", zona, "\n")
	}

	funcao cadeia identificarZona() {
		real nps = calcularPorcentagemNPS()
		
		se (nps <= 0.0) retorne "Crítica"
		senao se (nps <= 50.0) retorne "Aperfeiçoamento"
		senao se (nps <= 75.0) retorne "Qualidade"
		senao retorne "Excelência"
	}

	funcao resumirQuantidades() {
		escreverQuantidades(verdadeiro)
	}
	funcao apresentarQuantidades() {
		escreverQuantidades(falso)
	}

	funcao escreverQuantidades(logico resumo) {
		se (nao resumo ou detratores != 0) {
			escreva("Detratores: ", detratores, "\n")
		}
		se (nao resumo ou neutros != 0) {
			escreva("Neutros:    ", neutros, "\n")
		}
		se (nao resumo ou promotores != 0) {
			escreva("Promotores: ", promotores, "\n")
		}

		inteiro total = detratores + neutros + promotores

		se (nao resumo ou contemValores()) {
			escreva("\n")
		}
	}

	funcao logico contemValores() {
		retorne detratores + neutros + promotores != 0
	}

	funcao escreverNPS() {
		se (entradas == 0) {
			escreva("NPS Atual: --\n")
		} senao {
			real nps = calcularPorcentagemNPS()
			escreva("NPS Atual: ", nps, "%\n")
		}
	}

	funcao real calcularPorcentagemNPS() {
		real nps = (0.0 + promotores - detratores) / entradas
		retorne mat.arredondar(nps * 100.0, 2)
	}

	funcao inteiro pedirNota(inteiro nth, inteiro maximo) {
		inteiro nota
		
		escreva("(", nth, "/", maximo, ") Nota informada: ")
		leia(nota)

		retorne nota
	}

	funcao computarNota(inteiro nota) {
		entradas++

		escolha (identificarCateogria(nota)) {
			caso CAT_PROMOTOR:
				promotores++
				pare
			caso CAT_NEUTRO:
				neutros++
				pare
			caso CAT_DETRATOR:
				detratores++
				pare
		}
	}

	funcao caracter identificarCateogria(inteiro nota) {
		escolha (nota) {
			caso 10:
			caso 9:
				retorne CAT_PROMOTOR
			caso 8:
			caso 7:
				retorne CAT_NEUTRO
		}

		retorne CAT_DETRATOR
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 144; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */