programa
{
	inclua biblioteca Arquivos --> ar
	inclua biblioteca Texto --> tx
	inclua biblioteca Tipos --> tp
	inclua biblioteca Teclado --> tc
	inclua biblioteca Graficos --> gr
	
	funcao inicio() {
		gr.iniciar_modo_grafico(falso)
		gr.definir_dimensoes_janela(1000, 500)
		gr.definir_fonte_texto("Consolas")
		gr.definir_tamanho_texto(10.0)
		
		cadeia formatos[2] = { "Código|por", "Texto|txt" }
		cadeia local = ar.selecionar_arquivo(formatos, falso)

		logico existe = ar.arquivo_existe(local)

		se (nao existe) {
			escreva("Nenhum arquivo selecionado.\n")
			retorne
		}

		escreva("-----+ Conteúdo do Arquivo selecionado:\n")

		inteiro linhaAncora = 1
		inteiro quantidadeLeitura = 20

		inteiro comando = tc.TECLA_SETA_ACIMA
		
		enquanto (verdadeiro) {
			inteiro pArquivo = ar.abrir_arquivo(local, ar.MODO_LEITURA)
			
			se (comando == tc.TECLA_SETA_ACIMA e linhaAncora > 1) {
				linhaAncora--
			} senao
			se (comando == tc.TECLA_SETA_ABAIXO e nao ar.fim_arquivo(pArquivo)) {
				linhaAncora++
			} senao
			se (comando == tc.TECLA_ESPACO) {
				linhaAncora += quantidadeLeitura
			}

			mostrarSecao(linhaAncora, quantidadeLeitura, pArquivo)

			ar.fechar_arquivo(pArquivo)
			gr.renderizar()
			comando = tc.ler_tecla()
			limpa()
		}
	}
	
	funcao mostrarSecao(inteiro lInicio, inteiro qntLer, inteiro pArquivo) {
		para (inteiro n = 0; n < lInicio; n++) {
			ar.ler_linha(pArquivo)
		}

		inteiro linhaS = 1
		para (inteiro n = lInicio; n < lInicio + qntLer; n++) {
			cadeia linha = ar.ler_linha(pArquivo)
			cadeia linhaFormatada = tx.substituir(linha, "\t", "    ")

			cadeia linhaEscrever = gerarNLinha(n) + linhaFormatada + "\n"

			inteiro cor = gr.criar_cor(0, 0, 255)
			gr.definir_cor(cor)

			gr.desenhar_texto(0, linhaS*10, linhaEscrever)
			
			//escreva(linhaEscrever)
			linhaS++
		}
	}

	funcao cadeia gerarNLinha(inteiro nLinha) {
		cadeia nTexto = tp.inteiro_para_cadeia(nLinha, 10)
		retorne tx.preencher_a_esquerda(' ', 4, nTexto) + " |"
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 180; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {linhaAncora, 27, 10, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */