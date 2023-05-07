programa {
	const inteiro QUANTIDADE_MAX = 5

	const caracter OP_INSERIR = 'C'
	const caracter OP_CONSULTAR = 'R'
	const caracter OP_ATUALIZAR = 'U'
	const caracter OP_EXCLUIR = 'D'
	const caracter OP_SAIR = 'Q'

	cadeia nomes[QUANTIDADE_MAX]
	inteiro idades[QUANTIDADE_MAX]
	caracter sexo[QUANTIDADE_MAX]
	real salario[QUANTIDADE_MAX]

	logico saiuDoSistema = falso

	funcao inicio() {
		inicializarDados()

		enquanto (nao saiuDoSistema) {
			caracter opcao = rotinaMenuPrincipal()

			escolha (opcao) {
				caso OP_INSERIR:
					rotinaInserirFuncionario()
					pare
				caso OP_CONSULTAR:
					rotinaConsultarFuncionario()
					pare
				caso OP_ATUALIZAR:
					rotinaAtualizarFuncionario()
					pare
				caso OP_EXCLUIR:
					rotinaExcluirFuncionario()
					pare
				caso contrario:
					rotinaSair()
			}
		}

		despedida()
	}

	funcao apresentacao() {
		limpa()
		
		escreva("-----------------------------------------------\n")
		escreva("                      SAAF:                    \n")
		escreva("  Sistema Avançado de Análise de Funcionários  \n")
		escreva("-----------------------------------------------\n\n")
	}
	funcao apresentacaoComErro(cadeia erro) {
		apresentacao()

		escreva(erro + "\n\n")
	}
	funcao despedida() {
		apresentacao()
		
		escreva("Muito obrigado por utilizar o SAAF. Tenha um ótimo dia!\n")
	}

	funcao inicializarDados() {
		para (inteiro i = 0; i < QUANTIDADE_MAX; i++) {
			nomes[i] = ""
			idades[i] = 0
			sexo[i] = ' '
			salario[i] = 0.0
		}
	}

	funcao caracter rotinaMenuPrincipal() {
		apresentacao()
		
		enquanto (verdadeiro) {
			escreva("[1] Inserir novo funcionário\n")
			escreva("[2] Consultar funcionário existente\n")
			escreva("[3] Atualizar informações de funcionário\n")
			escreva("[4] Excluir funcionário\n")
			escreva("[5] Sair do programa\n\n")

			escreva("Informe o que deseja fazer: ")
			inteiro opcao
			leia(opcao)
	
			escolha (opcao) {
				caso 1: retorne OP_INSERIR
				caso 2: retorne OP_CONSULTAR
				caso 3: retorne OP_ATUALIZAR
				caso 4: retorne OP_EXCLUIR
				caso 5: retorne OP_SAIR
			}

			apresentacaoComErro("Erro: a opção " + opcao + " é inválida! Tente novamente.")
		}
		
		retorne OP_SAIR
	}

	funcao rotinaInserirFuncionario() {
		apresentacao()

		
	}

	funcao rotinaConsultarFuncionario() {
		apresentacao()
	}

	funcao rotinaAtualizarFuncionario() {
		apresentacao()
	}

	funcao rotinaExcluirFuncionario() {
		apresentacao()
	}

	funcao rotinaSair() {
		apresentacao()

		enquanto (verdadeiro) {
			escreva("Ao sair você perderá todos os dados armazenados.\n")
			escreva("Tem certeza que seja sair?\n\n")
	
			escreva("[1] Sim\n")
			escreva("[2] Nao\n\n")
	
			escreva("Resposta: ")
			inteiro opcao
			leia(opcao)
	
			escolha (opcao) {
				caso 1:
					saiuDoSistema = verdadeiro
					retorne
				caso 2:
					retorne
			}

			apresentacaoComErro("Erro: a opção " + opcao + " é inválida! Tente novamente.")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 242; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */