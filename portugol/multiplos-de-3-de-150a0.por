programa
{
	
	funcao inicio()
	{
		// Faça um algoritmo que mostre todos os números múltiplos de 3 entre
		// 0 e 150, em ordem inversa, ou seja de trás par frente.
		
		para (inteiro i = 150; i >= 0; i--) {
			se (i % 3 == 0) {
				escreva(i, "\n")
			}
		}
	}
}
