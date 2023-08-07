programa
{
	inclua biblioteca Matematica --> mat
	
	funcao inicio()
	{
		// Calcula IMC

		real altura
		real massa
		real imc
		cadeia condicao

		escreva("Informe sua altura: ")
		leia(altura)

		escreva("Informe sua massa (Kg): ")
		leia(massa)

		imc = mat.arredondar(massa / (altura * altura), 2)

		se (imc < 18.5) {
			condicao = "Magreza"
		} senao
		se (imc >= 18.3 e imc <= 24.9) {
			condicao = "Peso Normal"
		} senao
		se (imc >= 25.0 e imc <= 29.9) {
			condicao = "Sobrepeso"
		} senao {
			condicao = "Obeso"
		}
		
		escreva("Seu IMC é ", mat.arredondar(imc, 2), "\n")
		escreva("Sua condução é: ", condicao)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 92; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */