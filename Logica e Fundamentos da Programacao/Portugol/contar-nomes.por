programa
{
	
	funcao inicio()
	{
		// screva um algoritmo que leia uma lista de nomes do usuário até
		// encontrar o nome "fim" e depois imprima a quantidade de nomes
		// lidos (excluindo o "fim").

		cadeia nomeAtual
		inteiro qntNomes = -1
		
		escreva("Informe uma lista de nomes, e então escreva 'fim'\n")
		
		faca {
			leia(nomeAtual)
			qntNomes++
		} enquanto (
			nomeAtual != "fim" e
			nomeAtual != "Fim"
		)
		
		escreva("Você informou ", qntNomes, " nomes")
	}
}
