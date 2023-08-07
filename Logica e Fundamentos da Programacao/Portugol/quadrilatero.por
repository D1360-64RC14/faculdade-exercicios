programa
{
	funcao inicio ()
	{
		real altura
		real base
		real area
		real perimetro
		cadeia forma

		escreva("Informe a altura do quadrilátero: ")
		leia(altura)
		
		escreva("Informe o comprimento da base do quadrilátero: ")
		leia(base)
		
		perimetro = altura * 2.0 + base * 2.0
		area = altura * base

		escreva("\n")
		se (altura == base) {
			forma = "Quadrado"
		} senao {
			forma = "Retângulo"
		}
		
		escreva("Forma:     " + forma + "\n")
		escreva("Área:      " + area + "\n")
		escreva("Perímetro: " + perimetro)
	}
}