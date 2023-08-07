programa
{
	
	funcao inicio()
	{
		// Número primo

		inteiro numero
		escreva("Informe um número para verificar se é primo: ")
		leia(numero)

		limpa()

		logico primo = verdadeiro
		inteiro divisoes = 0

		se (numero <= 1) {
			escreva("São apenas válidos números maiores que 1")
		} senao {
			para (inteiro i = 1; i <= numero; i++) {
				se (numero % i == 0) {
					divisoes++
				}
			}
	
			se (divisoes > 2) {
				primo = falso
			}
	
			se (primo) {
				escreva("O número ", numero, " é primo")
			} senao {
				escreva("O número ", numero, " não é primo")
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 49; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */