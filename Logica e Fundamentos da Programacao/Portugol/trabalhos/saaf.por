programa {
	inclua biblioteca Texto --> tx
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> mat
	
	const inteiro CAPACIDADE_MAX = 5

	const caracter OP_INSERIR = 'C'
	const caracter OP_CONSULTAR = 'R'
	const caracter OP_ATUALIZAR = 'U'
	const caracter OP_EXCLUIR = 'D'
	const caracter OP_RELATORIO = 'r'
	const caracter OP_SAIR = 'Q'

	const caracter SEXO_MASCULINO = 'M'
	const caracter SEXO_FEMININO = 'F'
	const caracter SEXO_OUTRO = 'O'
	const cadeia SEXO_MASCULINO_NOME = "Masculino"
	const cadeia SEXO_FEMININO_NOME = "Feminino"
	const cadeia SEXO_OUTRO_NOME = "Outro"

	const cadeia NOME_VAZIO = ""
	const inteiro SISTEMA_CHEIO = -1

	const inteiro MAXIMO_IDADE = 150
	const inteiro MINIMO_IDADE = 18

	const inteiro ALERTA_VAZIO = 0
	const inteiro ALERTA_SEM_FUNCIONARIOS = 1
	const inteiro ALERTA_ERRO_INESPERADO = 2
	const inteiro ALERTA_FUNCIONARIO_INSERIDO = 3
	const inteiro ALERTA_FUNCIONARIO_EXCLUIDO = 4
	const inteiro ALERTA_FUNCIONARIO_ATUALIZADO = 5

	cadeia nomes[CAPACIDADE_MAX]
	inteiro idades[CAPACIDADE_MAX]
	caracter sexos[CAPACIDADE_MAX]
	real salarios[CAPACIDADE_MAX]

	logico saiuDoSistema = falso

	funcao inicio() {
		inicializarDados()

		inteiro codigoAlerta = ALERTA_VAZIO

		enquanto (nao saiuDoSistema) {
			caracter opcao = rotinaMenuPrincipal(codigoAlerta)

			escolha (opcao) {
				caso OP_INSERIR:
					codigoAlerta = rotinaInserirFuncionario()
					pare
				caso OP_CONSULTAR:
					codigoAlerta = rotinaConsultarFuncionario()
					pare
				caso OP_ATUALIZAR:
					codigoAlerta = rotinaAtualizarFuncionario()
					pare
				caso OP_EXCLUIR:
					codigoAlerta = rotinaExcluirFuncionario()
					pare
				caso OP_RELATORIO:
					codigoAlerta = rotinaExibirRelatorio()
					pare
				caso contrario:
					codigoAlerta = rotinaSair()
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
	funcao apresentacaoComOpcaoErrada(inteiro opcao) {
		apresentacaoComErro("Erro: a opção " + opcao + " é inválida! Tente novamente.")
	}
	funcao despedida() {
		apresentacao()
		
		escreva("Muito obrigado por utilizar o SAAF. Tenha um ótimo dia!\n")
	}

	funcao inicializarDados() {
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			nomes[i] = NOME_VAZIO
			// Não necessário
			/*idades[i] = 0
			sexos[i] = ' '
			salarios[i] = 0.0*/
		}
	}

	funcao caracter rotinaMenuPrincipal(inteiro codigoAlerta) {
		apresentacao()
		rotinaMostrarAlerta(codigoAlerta)
		
		enquanto (verdadeiro) {
			escreva("[1] Inserir novo funcionário\n")
			escreva("[2] Consultar funcionário existente\n")
			escreva("[3] Atualizar informações de funcionário\n")
			escreva("[4] Excluir funcionário\n")
			escreva("[5] Exibir relatório\n")
			escreva("[0] Sair do programa\n\n")

			escreva("Informe o que deseja fazer.\n")
			escreva("[?]: ")
			inteiro opcao
			leia(opcao)
	
			escolha (opcao) {
				caso 1: retorne OP_INSERIR
				caso 2: retorne OP_CONSULTAR
				caso 3: retorne OP_ATUALIZAR
				caso 4: retorne OP_EXCLUIR
				caso 5: retorne OP_RELATORIO
				caso 0: retorne OP_SAIR
			}

			apresentacaoComOpcaoErrada(opcao)
		}
		
		retorne OP_SAIR
	}

	funcao rotinaMostrarAlerta(inteiro codigoAlerta) {
		escolha (codigoAlerta) {
			caso ALERTA_SEM_FUNCIONARIOS:
				escreva("Alerta: não há funcionários armazenados no sistema.\n\n")
			pare
			caso ALERTA_ERRO_INESPERADO:
				escreva("Alerta: um erro inesperado foi ocorrido.\n\n")
			pare
			caso ALERTA_FUNCIONARIO_INSERIDO:
				escreva("Alerta: funcionário inserido com sucesso!\n\n")
			pare
			caso ALERTA_FUNCIONARIO_EXCLUIDO:
				escreva("Alerta: funcionário excluído com sucesso!\n\n")
			pare
			caso ALERTA_FUNCIONARIO_ATUALIZADO:
				escreva("Alerta: funcionário atualizado com sucesso!\n\n")
			pare
		}
	}

	funcao inteiro rotinaInserirFuncionario() {
		apresentacao()

		inteiro posicaoDisponivel = encontrarPosicaoDisponivel()

		se (posicaoDisponivel == SISTEMA_CHEIO) {
			logico iraSubstituir = operacaoSistemaCheio()
			se (nao iraSubstituir) {
				retorne ALERTA_VAZIO
			}
			posicaoDisponivel = pedirPosicaoParaSubstituir()
		}

		cadeia nome = pedirNomeDoFuncionario()
		inteiro idade = pedirIdadeDoFuncionaio()
		caracter sexo = pedirSexoDoFuncionario()
		real salario = pedirSalarioDoFuncionario()

		gravarFuncionario(posicaoDisponivel, nome, idade, sexo, salario)

		retorne ALERTA_FUNCIONARIO_INSERIDO
	}

	funcao inteiro encontrarPosicaoDisponivel() {
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nomes[i] == NOME_VAZIO) {
				retorne i
			}
		}

		retorne SISTEMA_CHEIO
	}

	// Perguntará o que deve ser feito em caso do sistema estiver cheio.
	// Retornará "verdadeiro" para Substituir Funcionário e "falso" para
	// Cancelar Operação.
	funcao logico operacaoSistemaCheio() {
		apresentacao()

		enquanto (verdadeiro) {
			escreva("Atualmente o sistema está cheio, o que deseja fazer?\n\n")
	
			escreva("[1] Substituir funcionário\n")
			escreva("[0] Cancelar operação\n\n")
	
			escreva("[?]: ")
			inteiro opcao
			leia(opcao)
	
			escolha (opcao) {
				caso 1: retorne verdadeiro
				caso 0: retorne falso
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne falso
	}

	funcao inteiro pedirPosicaoParaSubstituir() {
		apresentacao()
		
		enquanto (verdadeiro) {
			listarFuncionarios(verdadeiro)
			
			escreva("\nInforme por qual funcionário você deseja substituir.\n")
			escreva("[?]: ")
			
			inteiro opcao
			leia(opcao)

			inteiro posicao = opcao - 1
	
			se (posicaoEhValida(posicao)) {
				retorne posicao
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne 0
	}

	funcao logico posicaoEhValida(inteiro posicao) {
		se (posicao < 0 ou posicao >= CAPACIDADE_MAX) {
			retorne falso
		}

		retorne verdadeiro
	}

	funcao logico posicaoEhVazia(inteiro posicao) {
		retorne nomes[posicao] == NOME_VAZIO
	}

	funcao cadeia pedirNomeDoFuncionario() {
		apresentacao()

		enquanto (verdadeiro) {
			cadeia nome
			
			escreva("Insira o nome do funcionário: ")
			leia(nome)

			se (nome != NOME_VAZIO e sistemaContemNome(nome) != -1) {
				se (manterNomeDuplicado()) {
					retorne nome
				}
				
				apresentacao()
			} senao se (nome != NOME_VAZIO) {
				retorne nome
			} senao {
				apresentacaoComErro("Erro: o nome nao pode ser vazio!")
			}
		}

		retorne ""
	}

	funcao inteiro sistemaContemNome(cadeia nome) {
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nomes[i] == nome) {
				retorne i
			}
		}

		retorne -1
	}

	funcao logico manterNomeDuplicado() {
		apresentacao()
		
		enquanto (verdadeiro) {
			escreva("O sistema contém outro funcionário com exatamente o mesmo nome.\n\n")

			escreva("[1] Manter nome informado\n")
			escreva("[0] Informar outro nome\n\n")

			escreva("O que deseja fazer?\n")
			escreva("[?]: ")
			
			inteiro opcao
			leia(opcao)

			escolha (opcao) {
				caso 1: retorne verdadeiro
				caso 0: retorne falso
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne falso
	}

	funcao inteiro pedirIdadeDoFuncionaio() {
		apresentacao()

		enquanto (verdadeiro) {
			inteiro idade
			
			escreva("Insira a idade do funcionário: ")
			leia(idade)

			se (idade > MAXIMO_IDADE) {
				apresentacaoComErro("Erro: a idade máxima é " + MAXIMO_IDADE)
			} senao se (idade < MINIMO_IDADE) {
				apresentacaoComErro("Erro: a idade mínima é " + MINIMO_IDADE)
			} senao {
				retorne idade
			}
		}

		retorne 0
	}

	funcao caracter pedirSexoDoFuncionario() {
		apresentacao()

		enquanto (verdadeiro) {
			escreva("Selecione o sexo do funcionário:\n\n")
	
			escreva("[1] Feminino\n")
			escreva("[2] Masculino\n")
			escreva("[3] Outro\n\n")
	
			escreva("[?]: ")
			inteiro opcao
			leia(opcao)
	
			escolha (opcao) {
				caso 1: retorne SEXO_FEMININO
				caso 2: retorne SEXO_MASCULINO
				caso 3: retorne SEXO_OUTRO
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne SEXO_OUTRO
	}

	funcao real pedirSalarioDoFuncionario() {
		apresentacao()

		enquanto (verdadeiro) {
			escreva("Informe o salário do funcionário: ")
	
			real salario
			leia(salario)

			se (salario >= 0.0) {
				retorne mat.arredondar(salario, 2)
			}

			apresentacaoComErro("Erro: o salário deve ser um valor positivo!")
		}

		retorne 0.0
	}

	funcao gravarFuncionario(inteiro posicao, cadeia nome, inteiro idade, caracter sexo, real salario) {
		nomes[posicao] = nome
		idades[posicao] = idade
		sexos[posicao] = sexo
		salarios[posicao] = salario
	}

	funcao inteiro rotinaConsultarFuncionario() {
		apresentacao()

		se (quantidadeFuncionarios() == 0) {
			retorne ALERTA_SEM_FUNCIONARIOS
		}
		
		enquanto (verdadeiro) {
			listarFuncionarios(verdadeiro)

			escreva("\n[0] Cancelar operação\n")

			escreva("\nInforme qual funcionário você deseja consultar.\n")
			escreva("[?]: ")

			inteiro opcao
			leia(opcao)

			inteiro posicao = opcao - 1

			se (opcao == 0) {
				retorne ALERTA_VAZIO
			} senao se (posicaoEhValida(posicao) e nao posicaoEhVazia(posicao)) {
				logico desejaConsultarOutro = exibirComConfirmacao(posicao)

				se (nao desejaConsultarOutro) {
					retorne ALERTA_VAZIO
				}

				apresentacao()
			} senao {
				apresentacaoComOpcaoErrada(opcao)
			}
		}

		retorne ALERTA_ERRO_INESPERADO
	}

	// Exibe o funcionário e pergunta se deseja consultar algum outro.
	// Retorna falso caso o usuário deseje sair.
	funcao logico exibirComConfirmacao(inteiro funcionario) {
		apresentacao()
		
		enquanto (verdadeiro) {
			exibirFuncionario(funcionario)
			
			escreva("\n[1] Consultar outro funcionário\n")
			escreva("[0] Cancelar operação\n\n")
	
			escreva("Escolha o que deseja fazer em seguida.\n")
			escreva("[?]: ")
	
			inteiro opcao
			leia(opcao)

			escolha (opcao) {
				caso 1: retorne verdadeiro
				caso 0: retorne falso
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne falso
	}

	funcao exibirFuncionario(inteiro posicao) {
		cadeia nome = nomes[posicao]
		inteiro idade = idades[posicao]
		cadeia salario = salarioFormatadoDe(posicao)
		caracter sexo = sexos[posicao]
		cadeia sexoTexto = sexoNomeado(posicao)

		cadeia referir = "do funcionário"
		se (sexo == SEXO_FEMININO) {
			referir = "da funcionária"
		}

		escreva("Detalhes " + referir + " " + nome + ":\n\n")
		escreva("Idade:   ", idade, " anos\n")
		escreva("Salário: ", salario, "\n")
		escreva("Sexo:    ", sexoTexto, "\n")
	}

	funcao inteiro rotinaAtualizarFuncionario() {
		apresentacao()

		se (quantidadeFuncionarios() == 0) {
			retorne ALERTA_SEM_FUNCIONARIOS
		}

		enquanto (verdadeiro) {
			listarFuncionarios(verdadeiro)

			escreva("\n[0] Cancelar operação\n\n")

			escreva("Informe qual funcionário você deseja atualizar.\n")
			escreva("[?]: ")

			inteiro opcao
			leia(opcao)
			
			inteiro posicao = opcao - 1

			se (opcao == 0) {
				retorne ALERTA_VAZIO
			} senao se (posicaoEhValida(posicao) e nao posicaoEhVazia(posicao)) {
				perguntarOQueDesejaAtualizarEm(posicao)
				retorne ALERTA_FUNCIONARIO_ATUALIZADO
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne ALERTA_ERRO_INESPERADO
	}

	funcao perguntarOQueDesejaAtualizarEm(inteiro posicao) {
		apresentacao()

		enquanto (verdadeiro) {
			cadeia nomeAnterior = nomes[posicao]
			inteiro idadeAnterior = idades[posicao]
			cadeia sexoAnterior = sexoNomeado(posicao)
			cadeia salarioAnterior = salarioFormatadoDe(posicao)
			
			escreva("[1] Nome    -> ", nomeAnterior, "\n")
			escreva("[2] Idade   -> ", idadeAnterior, "\n")
			escreva("[3] Sexo    -> ", sexoAnterior, "\n")
			escreva("[4] Salário -> ", salarioAnterior, "\n\n")

			escreva("[0] Finalizar operação\n\n")

			escreva("Informe qual campo deseja atualizar.\n")
			escreva("[?]: ")

			inteiro opcao
			leia(opcao)

			escolha (opcao) {
				caso 1:
					nomes[posicao] = pedirNomeDoFuncionario()
					apresentacao()
					pare
				caso 2:
					idades[posicao] = pedirIdadeDoFuncionaio()
					apresentacao()
					pare
				caso 3:
					sexos[posicao] = pedirSexoDoFuncionario()
					apresentacao()
					pare
				caso 4:
					salarios[posicao] = pedirSalarioDoFuncionario()
					apresentacao()
					pare
				caso 0: retorne
				caso contrario:
					apresentacaoComOpcaoErrada(opcao)
			}
		}
	}

	funcao inteiro rotinaExcluirFuncionario() {
		apresentacao()

		se (quantidadeFuncionarios() == 0) {
			retorne ALERTA_SEM_FUNCIONARIOS
		}

		enquanto (verdadeiro) {
			listarFuncionarios(verdadeiro)

			escreva("\n[0] Cancelar operação\n\n")

			escreva("Informe qual funcionário você deseja excluir.\n")
			escreva("[?]: ")

			inteiro opcao
			leia(opcao)
			
			inteiro posicao = opcao - 1

			se (opcao == 0) {
				retorne ALERTA_VAZIO
			} senao se (posicaoEhValida(posicao) e nao posicaoEhVazia(posicao)) {
				logico deveExcluir = confirmarExclusaoDeFuncionarioEm(posicao)
				se (deveExcluir) {
					excluirFuncionarioEm(posicao)
					retorne ALERTA_FUNCIONARIO_EXCLUIDO
				}
				retorne ALERTA_VAZIO
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne ALERTA_ERRO_INESPERADO
	}

	funcao logico confirmarExclusaoDeFuncionarioEm(inteiro posicao) {
		apresentacao()

		enquanto (verdadeiro) {
			exibirFuncionario(posicao)

			escreva("\nVocê tem certeza que deseja excluir?\n\n")

			escreva("[1] Sim\n")
			escreva("[0] Não\n\n")

			escreva("[?]: ")

			inteiro opcao
			leia(opcao)

			escolha (opcao) {
				caso 1: retorne verdadeiro
				caso 0: retorne falso
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne falso
	}

	funcao excluirFuncionarioEm(inteiro posicao) {
		nomes[posicao] = NOME_VAZIO
	}

	funcao inteiro rotinaExibirRelatorio() {
		apresentacao()

		inteiro qntFuncionarios = quantidadeFuncionarios()
		
		se (qntFuncionarios == 0) {
			retorne ALERTA_SEM_FUNCIONARIOS
		}

		escreva("Quantidade de funcionários: ", qntFuncionarios, "\n\n")
		
		exibirMedias()

		escreva("\n")

		exibirFuncionariosMaiorSalario()
		exibirFuncionariosMenorIdade()

		escreva("\n")
		
		escreva("Pressione [enter] para voltar ao menu...\n")
		cadeia nada
		leia(nada)

		retorne ALERTA_VAZIO
	}

	funcao exibirMedias() {
		real mediaIdadeSexoFeminino = calcularMediaIdadeDoSexo(SEXO_FEMININO)
		real mediaIdadeSexoMasculino = calcularMediaIdadeDoSexo(SEXO_MASCULINO)
		real mediaIdadeSexoOutro = calcularMediaIdadeDoSexo(SEXO_OUTRO)

		real mediaSalarioSexoFeminino = calcularMediaSalarioDoSexo(SEXO_FEMININO)
		real mediaSalarioSexoMasculino = calcularMediaSalarioDoSexo(SEXO_MASCULINO)
		real mediaSalarioSexoOutro = calcularMediaSalarioDoSexo(SEXO_OUTRO)

		escreva("Médias de:\n")
		se (mediaIdadeSexoFeminino > 0.0) {
			escreva(" - Idade do sexo feminino:    ", mat.arredondar(mediaIdadeSexoFeminino, 2), " anos\n")
		}
		se (mediaIdadeSexoMasculino > 0.0) {
			escreva(" - Idade do sexo masculino:   ", mat.arredondar(mediaIdadeSexoMasculino, 2), " anos\n")
		}
		se (mediaIdadeSexoOutro > 0.0) {
			escreva(" - Idade de outros sexos:     ", mat.arredondar(mediaIdadeSexoOutro, 2), " anos\n")
		}
		
		se (mediaSalarioSexoFeminino > 0.0) {
			escreva(" - Salário do sexo feminino:  ", salarioFormatado(mediaSalarioSexoFeminino), "\n")
		}
		se (mediaSalarioSexoMasculino > 0.0) {
			escreva(" - Salário do sexo masculino: ", salarioFormatado(mediaSalarioSexoMasculino), "\n")
		}
		se (mediaSalarioSexoOutro > 0.0) {
			escreva(" - Salário de outro sexo:     ", salarioFormatado(mediaSalarioSexoOutro), "\n")
		}
	}

	funcao real calcularMediaIdadeDoSexo(caracter sexo) {
		inteiro quantidadeIdades = 0
		real somaIdades = 0.0
		
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i) e sexos[i] == sexo) {
				quantidadeIdades++
				somaIdades += idades[i]
			}
		}

		se (quantidadeIdades == 0) {
			retorne 0.0
		}
		retorne somaIdades / quantidadeIdades
	}
	funcao real calcularMediaSalarioDoSexo(caracter sexo) {
		inteiro quantidadeSalarios = 0
		real somaSalarios = 0.0
		
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i) e sexos[i] == sexo) {
				quantidadeSalarios++
				somaSalarios += salarios[i]
			}
		}

		se (quantidadeSalarios == 0) {
			retorne 0.0
		}
		retorne somaSalarios / quantidadeSalarios
	}

	funcao exibirFuncionariosMaiorSalario() {
		real maiorSalario = calcularMaiorSalario()
		inteiro quantidadeComMaiorSalario = quantidadeSalariosIguaisA(maiorSalario)

		se (quantidadeComMaiorSalario == 1) {
			escreva("Funcionário(a) com maior salário: ")

			para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
				se (nao posicaoEhVazia(i) e salarios[i] == maiorSalario) {
					escreva(nomes[i], " (", salarioFormatadoDe(i), ")\n")
					pare
				}
			}
			retorne
		}
		
		escreva("Funcionários(as) com maior salário:\n")

		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i) e salarios[i] == maiorSalario) {
				escreva(" - ", nomes[i], " (", salarioFormatadoDe(i), ")\n")
			}
		}
	}
	funcao exibirFuncionariosMenorIdade() {
		inteiro menorIdade = calcularMenorIdade()
		inteiro quantidadeComMenorIdade = quantidadeIdadesIguaisA(menorIdade)

		se (quantidadeComMenorIdade == 1) {
			escreva("Funcionário(a) com menor idade: ")

			para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
				se (nao posicaoEhVazia(i) e idades[i] == menorIdade) {
					escreva(nomes[i], " (", idades[i], " anos)\n")
					pare
				}
			}
			retorne
		}
		
		escreva("Funcionários(as) com menor idade:\n")

		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i) e idades[i] == menorIdade) {
				escreva(" - ", nomes[i], " (", idades[i], " anos)\n")
			}
		}
	}

	funcao real calcularMaiorSalario() {
		real maior = 0.0

		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i) e salarios[i] > maior) {
				maior = salarios[i]
			}
		}

		retorne maior
	}
	funcao inteiro quantidadeSalariosIguaisA(real salario) {
		inteiro quantidade = 0
		
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i) e salarios[i] == salario) {
				quantidade++
			}
		}

		retorne quantidade
	}
	
	funcao inteiro calcularMenorIdade() {
		inteiro menor = primeiraIdade()

		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i) e idades[i] < menor) {
				menor = idades[i]
			}
		}

		retorne menor
	}
	funcao inteiro quantidadeIdadesIguaisA(inteiro idade) {
		inteiro quantidade = 0
		
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i) e idades[i] == idade) {
				quantidade++
			}
		}

		retorne quantidade
	}

	funcao inteiro primeiraIdade() {
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i)) {
				retorne idades[i]
			}
		}

		retorne 0
	}

	funcao listarFuncionarios(logico comIndices) {
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nomes[i] != NOME_VAZIO) {
				cadeia sexo = sexoNomeado(i)

				se (comIndices) {
					escreva("[", i + 1, "] ")
				} senao {
					escreva("  ")
				}
				escreva(nomes[i], "\n")
			}
		}
	}

	funcao cadeia sexoNomeado(inteiro posicao) {
		caracter sexo = sexos[posicao]
		
		escolha (sexo) {
			caso SEXO_FEMININO: retorne SEXO_FEMININO_NOME
			caso SEXO_MASCULINO: retorne SEXO_MASCULINO_NOME
		}

		retorne SEXO_OUTRO_NOME
	}
	funcao cadeia salarioFormatadoDe(inteiro posicao) {
		retorne salarioFormatado(salarios[posicao])
	}
	funcao cadeia salarioFormatado(real salario) {
		cadeia salarioTexto = tp.real_para_cadeia(mat.arredondar(salario, 2))

		inteiro posicaoDecimal = tx.posicao_texto(".", salarioTexto, 0)
		inteiro tamanhoSalario = tx.numero_caracteres(salarioTexto)

		inteiro quantidadeCasasDecimais = tamanhoSalario - posicaoDecimal - 1

		se (quantidadeCasasDecimais == 1) {
			retorne "R$ " + salarioTexto + "0"
		}
		retorne "R$ " + salarioTexto
	}

	funcao inteiro quantidadeFuncionarios() {
		inteiro quantidade = 0
		
		para (inteiro i = 0; i < CAPACIDADE_MAX; i++) {
			se (nao posicaoEhVazia(i)) {
				quantidade++
			}
		}

		retorne quantidade
	}

	funcao inteiro rotinaSair() {
		apresentacao()

		enquanto (verdadeiro) {
			escreva("Ao sair você perderá todos os dados armazenados.\n")
			escreva("Tem certeza que seja sair?\n\n")
	
			escreva("[1] Sim\n")
			escreva("[0] Não\n\n")
	
			escreva("[?]: ")
			inteiro opcao
			leia(opcao)
	
			escolha (opcao) {
				caso 1:
					saiuDoSistema = verdadeiro
					retorne ALERTA_VAZIO
				caso 0:
					retorne ALERTA_VAZIO
			}

			apresentacaoComOpcaoErrada(opcao)
		}

		retorne ALERTA_ERRO_INESPERADO
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1184; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */