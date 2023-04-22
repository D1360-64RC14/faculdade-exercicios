programa
{
	
	funcao inicio()
	{
		// Pega salário, calcula aliquota, imposto de INSS (regressivo)
		
		// Faixas salariais
		const real salarioFaixa1 = 1302.00
		const real salarioFaixa2 = 2571.29
		const real salarioFaixa3 = 3856.94
		const real salarioFaixa4 = 7507.49

		// Alíquotas
		const real aliquotaFaixa1 = 7.5
		const real aliquotaFaixa2 = 9.0
		const real aliquotaFaixa3 = 12.0
		const real aliquotaFaixa4 = 14.0
		
		real salario
		real aliquotaTotal = 0.0
		real salarioDescontado

		escreva("Informe seu salário: ")
		leia(salario)

		se (salario <= salarioFaixa1) {
			aliquotaTotal += salario * aliquotaFaixa1 / 100.0
		} senao {
			aliquotaTotal += salarioFaixa1 * aliquotaFaixa1 / 100.0
		}

		se (salario > salarioFaixa1 e salario <= salarioFaixa2) {
			aliquotaTotal += (salario - salarioFaixa1) * aliquotaFaixa2 / 100.0
		} senao
		se (salario > salarioFaixa2) {
			aliquotaTotal += (salarioFaixa2 - salarioFaixa1 + 0.01) * aliquotaFaixa2 / 100.0
		}
		
		se (salario > salarioFaixa2 e salario <= salarioFaixa3) {
			aliquotaTotal += (salario - salarioFaixa2) * aliquotaFaixa3 / 100.0
		} senao
		se (salario > salarioFaixa3) {
			aliquotaTotal += (salarioFaixa3 - salarioFaixa2 + 0.01) * aliquotaFaixa3 / 100.0
		}

		se (salario > salarioFaixa3 e salario <= salarioFaixa4) {
			aliquotaTotal += (salario - salarioFaixa3) * aliquotaFaixa4 / 100.0
		} senao
		se (salario > salarioFaixa4) {
			aliquotaTotal += (salarioFaixa4 - salarioFaixa3 + 0.01) * aliquotaFaixa4 / 100.0
		}

		salarioDescontado = salario - aliquotaTotal

		escreva("Sua alíquota é de ", aliquotaTotal, " reais")
		escreva("\n")
		escreva("Seu salário com o desconto da alíquota é de ", salarioDescontado)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1502; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {aliquotaTotal, 21, 7, 13};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */