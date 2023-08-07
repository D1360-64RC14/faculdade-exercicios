programa
{
	
	funcao inicio()
	{
		// pega salário, calcula aliquota, imposto de INSS (regressivo)
		real salario
		real aliquota = 0.0
		real salarioDesconto

		escreva("Informe seu salário: ")
		leia(salario)

		se (salario <= 1302) {
			aliquota = aliquota + salario * 0.075
		} senao {
			aliquota = aliquota + 1302 * 0.075
		}

		se (salario >= 1302.01 e salario <= 2571.29) {
			aliquota = aliquota + (salario - 1302.00) * 0.09
		} senao
		se (salario > 2571.29) {
			aliquota = aliquota + (2571.29 - 1302.01) * 0.09
		}
		
		se (salario >= 2571.3 e salario <= 3856.94) {
			aliquota = aliquota + (salario - 2571.29) * 0.12
		} senao
		se (salario > 3856.94) {
			aliquota = aliquota + (3856.94 - 2571.29) * 0.12
		}

		se (salario >= 3856.95 e salario <= 7507.49) {
			aliquota = aliquota + (salario - 3856.94) * 0.14
		} senao
		se (salario > 7507.49) {
			aliquota = aliquota + (7507.49 - 3856.94) * 0.14
		}

		salarioDesconto = salario - aliquota

		escreva("Sua alíquota é de ", aliquota, " reais")
		escreva("\n")
		escreva("Seu salário com o desconto é de ", salarioDesconto)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 164; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {aliquota, 8, 7, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */