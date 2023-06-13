programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> tx

	const inteiro DIAS_MESES[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
	const cadeia data_separador = "-"

	// 2021-05
	funcao inicio()
	{
		cadeia data
		leia(data)

		limpa()
		
		apresentar_ano(data)
		apresentar_mes(data)
	}

	funcao apresentar_ano(cadeia data)
	{
		inteiro ano = extrair_ano(data)
		
		escreva("O ano de ", ano)

		se (nao ano_eh_bissexto(ano))
		{
			escreva(" não")
		}
		escreva(" é bissexto.", "\n")
	}
	funcao apresentar_mes(cadeia data)
	{
		inteiro ano = extrair_ano(data)
		inteiro mes = extrair_mes(data)
		
		se (nao mes_eh_valido(mes))
		{
			escreva("Erro: o mês informado é inválido!\n")
			retorne
		}
		
		inteiro dias_em_mes = quantidade_dias_mes(mes, ano)
		escreva("O ", mes + 1, "º mês contém ", dias_em_mes, " dias.\n")
	}

	funcao inteiro extrair_ano(cadeia data)
	{
		cadeia ano = extrair_cadeia_entre_ocorrencias(data, data_separador, 0, 1)
		retorne tp.cadeia_para_inteiro(ano, 10)
	}
	funcao inteiro extrair_mes(cadeia data)
	{
		cadeia mes = extrair_cadeia_entre_ocorrencias(data, data_separador, 1, 2)
		retorne tp.cadeia_para_inteiro(mes, 10) - 1
	}
	funcao inteiro extrair_dia(cadeia data)
	{
		cadeia dia = extrair_cadeia_entre_ocorrencias(data, data_separador, 2, 3)
		retorne tp.cadeia_para_inteiro(dia, 10)
	}

	funcao logico contem_dia(cadeia data)
	{
		retorne quantidade_ocorrencias(data, "-") >= 2
	}
	funcao logico contem_mes(cadeia data)
	{
		retorne quantidade_ocorrencias(data, "-") >= 1
	}

	funcao logico mes_eh_valido(inteiro mes)
	{
		retorne mes >= 0 e mes <= 11
	}
	funcao logico dia_eh_valido(inteiro dia, inteiro mes, inteiro ano)
	{
		retorne dia >= 0 e dia <= quantidade_dias_mes(mes, ano)
	}

	funcao cadeia extrair_cadeia_entre_ocorrencias(cadeia texto, cadeia ocorrencia, inteiro primeira, inteiro segunda)
	{
		se (primeira == segunda)
		{
			retorne ""
		}
		
		inteiro indice_inicial = indice_nth_ocorrencia(primeira, data_separador, texto)
		inteiro indice_final = indice_nth_ocorrencia(segunda, data_separador, texto)

		se (indice_inicial != 0)
		{
			indice_inicial++
		}

		se (indice_final == -1)
		{
			indice_final = tx.numero_caracteres(texto)
		}

		retorne tx.extrair_subtexto(texto, indice_inicial, indice_final)
	}

	funcao inteiro quantidade_ocorrencias(cadeia texto, cadeia ocorrencia)
	{
		inteiro ocorrencias = 0
		inteiro indice_ocorrencia = 0

		enquanto (verdadeiro)
		{
			indice_ocorrencia = tx.posicao_texto(ocorrencia, texto, indice_ocorrencia)
			
			se (indice_ocorrencia == -1) {
				pare
			}

			ocorrencias++
			indice_ocorrencia++
		}

		retorne ocorrencias
	}

	funcao inteiro indice_nth_ocorrencia(inteiro nth, cadeia ocorrencia, cadeia texto)
	{
		inteiro ocorrencias = 0
		inteiro indice_ocorrencia = 0

		enquanto (verdadeiro)
		{
			indice_ocorrencia = tx.posicao_texto(ocorrencia, texto, indice_ocorrencia)
			
			se (indice_ocorrencia == -1 ou ocorrencias == nth - 1) {
				retorne indice_ocorrencia
			}

			ocorrencias++
			indice_ocorrencia++
		}

		retorne -1
	}

	funcao inteiro quantidade_dias_mes(inteiro mes, inteiro ano)
	{
		inteiro dias = DIAS_MESES[mes]
		
		se (mes == 1 e ano_eh_bissexto(ano))
		{
			dias++
		}

		retorne dias
	}

	funcao logico ano_eh_bissexto(inteiro ano)
	{
		retorne ano % 4 == 0
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 358; 
 * @DOBRAMENTO-CODIGO = [20, 32, 47, 52, 57, 63, 67, 72, 76, 81, 104, 124, 144, 156];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */