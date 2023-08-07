programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> tx
	inclua biblioteca Calendario --> cal

	const inteiro DIAS_MESES[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
	const cadeia data_separador = "-"

	funcao inicio()
	{
		cadeia data
		escreva("Qual sua data de nascimento?\n")
		escreva("[AAAA-MM-DD]: ")
		
		leia(data)

		limpa()

		se (nao data_eh_valida(data)) {
			escreva("Sua data é inválida!\n")
			retorne
		}

		cadeia dia = extrair_dia(data)
		cadeia mes = extrair_mes(data)
		cadeia ano = extrair_ano(data)

		inteiro dia_n = tp.cadeia_para_inteiro(dia, 10)
		inteiro mes_n = tp.cadeia_para_inteiro(mes, 10)
		inteiro ano_n = tp.cadeia_para_inteiro(ano, 10)

		inteiro ano_hoje = cal.ano_atual()
		inteiro mes_hoje = cal.mes_atual()
		inteiro dia_hoje = cal.dia_mes_atual()

		inteiro idade = ano_hoje - ano_n

		se (mes_n > mes_hoje) {
			idade--
			escreva("reduziu no mes\n")
		}
		se (dia_n > dia_hoje e (mes_n > mes_hoje)) {
			idade--
			escreva("reduziu no dia\n")
		}

		se (idade < 0) {
			escreva("Você ainda não nasceu!\n")
		} senao {
			escreva("Hoje você tem ", idade, " anos.")
		}
	}

	funcao logico data_eh_valida(cadeia data) {
		inteiro ocorrencias = quantidade_ocorrencias(data, "-")
		logico ano_eh_negativo = falso

		se (tx.obter_caracter(data, 0) == '-') {
			ano_eh_negativo = verdadeiro
		}

		se (ocorrencias != 2 e nao ano_eh_negativo) retorne falso
		se (ocorrencias != 3 e ano_eh_negativo) retorne falso

		inteiro tamanho_data = tx.numero_caracteres(data)
		data = tx.extrair_subtexto(data, 1, tamanho_data)

		cadeia dia = extrair_dia(data)
		cadeia mes = extrair_mes(data)
		cadeia ano = extrair_ano(data)

		logico dia_eh_numero = tp.cadeia_e_inteiro(dia, 10)
		logico mes_eh_numero = tp.cadeia_e_inteiro(mes, 10)
		logico ano_eh_numero = tp.cadeia_e_inteiro(ano, 10)

		se (nao dia_eh_numero ou nao mes_eh_numero ou nao ano_eh_numero) retorne falso

		inteiro dia_n = tp.cadeia_para_inteiro(dia, 10)
		inteiro mes_n = tp.cadeia_para_inteiro(mes, 10) - 1
		inteiro ano_n = tp.cadeia_para_inteiro(ano, 10)

		se (ano_eh_negativo) {
			ano_n *= -1
		}

		logico mes_valido = mes_eh_valido(mes_n)
		se (nao mes_valido) retorne falso
		
		logico ano_valido = dia_eh_valido(dia_n, mes_n, ano_n)
		se (nao ano_valido) retorne falso

		retorne verdadeiro
	}

	funcao cadeia extrair_ano(cadeia data)
	{
		cadeia ano = extrair_cadeia_entre_ocorrencias(data, data_separador, 0, 1)
		retorne ano
	}
	funcao cadeia extrair_mes(cadeia data)
	{
		cadeia mes = extrair_cadeia_entre_ocorrencias(data, data_separador, 1, 2)
		retorne mes
	}
	funcao cadeia extrair_dia(cadeia data)
	{
		cadeia dia = extrair_cadeia_entre_ocorrencias(data, data_separador, 2, 3)
		retorne dia
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
 * @POSICAO-CURSOR = 975; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {dia_hoje, 35, 10, 8}-{idade, 37, 10, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */