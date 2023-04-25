// Objetivo: Leia uma lista de, no máximo, 10 nomes (não podendo haver repetidos) e os
//           mostre enquanto estiver escrevendo. Pare de ler ao digitar "sair".

programa {
	const inteiro MAXIMO = 10

	cadeia nomes[MAXIMO]
	inteiro quantidadeDeNomes = 0

	funcao inicio() {
		cadeia nomeInformado = ""
		
		preencherNomesEmBranco()
		
		faca {
			mostrarNomes()
			escreva("\n")

			// A saída (retorno) da função "pedirNome" será
			// armazenado na variável "nomeInformado".
			nomeInformado = pedirNome()
			
			limpa()

			se (nomeInformado == "") {
				escreva("Informe um nome não vazio.\n\n")
			} senao se (nomeJaExiste(nomeInformado)) {
				escreva("O nome ", nomeInformado, " já existe! Informe outro.\n\n")
			} senao se (nomeInformado != "sair") {
				armazenarNome(nomeInformado)
			}
		} enquanto (nomeInformado != "sair" e quantidadeDeNomes < MAXIMO)

		limpa()

		escreva("Todos os nomes informados foram:\n")
		mostrarNomes()
	}

	// Se tentarmos ler o vetor de nomes com nenhum conteúdo,
	// ocorrerá um erro. Por isso é necessário prencher com
	// alguma coisa.
	funcao preencherNomesEmBranco() {
		para (inteiro i = 0; i < MAXIMO; i++) {
			nomes[i] = ""
		}
	}

	// Pede um nome ao usuário e retorna o mesmo.
	funcao cadeia pedirNome() {
		cadeia resposta
		escreva("Informe um nome: ")
		leia(resposta)

		retorne resposta
	}

	// Verifica se o dado nome já não existe no vetor.
	funcao logico nomeJaExiste(cadeia nome) {
		logico existe = falso

		para (inteiro i = 0; i < MAXIMO; i++) {
			se (nomes[i] == nome) {
				existe = verdadeiro
			}
		}

		retorne existe
	}

	// Mostra todo o conteúdo do vetor de nomes.
	funcao mostrarNomes() {
		inteiro n = 1
		
		para (inteiro i = 0; i < MAXIMO; i++) {
			cadeia nome = nomes[i]
			
			se (nome != "") {
				escreva("  ", n, ". ", nome, "\n")
			}
			
			n++
		}
	}

	// Armazena o dado nome.
	funcao armazenarNome(cadeia nome) {
		nomes[quantidadeDeNomes] = nome
		quantidadeDeNomes++
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 167; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */