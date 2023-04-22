programa
{
	inclua biblioteca Matematica --> mat

	funcao inicio()
	{
		const real gOX = 6.0, gOY = 1.0
		const real fOX = 4.0, fOY = 1.0

		const real limiteSuperiorY = 10.0
		
		real a, b, c
		
		escreva("Numa função f(x) = ax² + bx + c, informe...\n")
		escreva("a: ")
		leia(a)

		escreva("b: ")
		leia(b)

		escreva("c: ")
		leia(c)

		limpa()

		se (a == 0) {
			escreva("O valor 'a' não pode ser igual a 0!")
			retorne
		}

		real x1, x2
		real delta = b*b - 4.0 * a * c
		real xVertice = -b / (4.0 * a)
		real yVertice = (-delta) / (4.0 * a)
		
		se (delta >= 0) {
			x1 = (-b + mat.raiz(delta, 2.0)) / (2 * a)
			x2 = (-b - mat.raiz(delta, 2.0)) / (2 * a)
		} senao {
			x1 = 0.0
			x2 = 0.0
		}

		se (x1 > x2) {
			x1 = x1 + x2
			x2 = x1 - x2
			x1 = x1 - x2
		}

		inteiro direcao = 1
		se (a < 0) {
			direcao = -1
		}

		real minY = mat.arredondar(yVertice, 0),
			maxY = mat.arredondar(yVertice + limiteSuperiorY, 0)

		se (yVertice < 0) {
			maxY = 0.0
		}

		real alcanceGraficoSobreX = mat.valor_absoluto(x1) + mat.valor_absoluto(x2),
			alcanceGraficoSobreY = mat.valor_absoluto(minY) + mat.valor_absoluto(maxY)

		real gMinY = mat.arredondar(minY, 0),
			gMaxY = mat.arredondar(maxY, 0),
			gMinX = mat.arredondar(-(alcanceGraficoSobreX / 2 + xVertice), 0),
			gMaxX = mat.arredondar(alcanceGraficoSobreX / 2 - xVertice, 0)

		para (real gY = gMaxY * gOY; gY >= gMinY * gOY; gY--) {
			real y = gY * (1.0 / fOY)
			
			para (real gX = gMinX * gOX; gX <= gMaxX * gOX; gX++) {
				real x = gX * (1.0 / fOX)

				real dominio = a * x*x + b * x + c
				real dominioArr = mat.arredondar(dominio, 0)

				logico ponto = y == dominioArr

				se (x == 0 e y == 0) {
					escreva('0')
				} senao se (ponto e (x == 0 ou y == 0)) {
					escreva('+')
				} senao se (x == 0) {
					escreva('|')
				} senao se (y == 0) {
					escreva('-')
				} senao se (ponto) {
					escreva('*')
				} senao {
					escreva('.')
				}
			}
			
			escreva("\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 886; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {yVertice, 34, 7, 8}-{alcanceGraficoSobreX, 62, 7, 20}-{gMinX, 67, 3, 5}-{gMaxX, 68, 3, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */