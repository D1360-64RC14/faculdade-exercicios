package main

/*
	Elabore um programa que simule um jogo simples de dados de 6 faces entre dois jogadores. Nesse jogo,
	os jogadores A e B lançam os dados, e quem obtiver o maior valor ganha. Caso o número seja o mesmo
	para ambos os jogadores, ocorre um empate. A saída do programa deve ser uma mensagem mostrando qual
	número cada jogador obteve e anunciando o resultado (vitória de A, B ou empate). Observações:

	  - Utilizar um gerador de números aleatórios;
	  - Não é necessária a entrada de dados do usuário.
*/

import (
	"fmt"
	"math/rand"
)

func main() {
	playerA := rand.Intn(6) + 1
	playerB := rand.Intn(6) + 1

	winner := 'E'
	if playerA > playerB {
		winner = 'A'
	} else if playerB > playerA {
		winner = 'B'
	}

	fmt.Printf("O jogador A jogou... %d\n", playerA)
	fmt.Printf("O jogador B jogou... %d\n", playerB)
	fmt.Println()

	switch winner {
	case 'E':
		fmt.Println("Deu empate!")
	case 'A', 'B':
		fmt.Printf("O ganhador foi... o jogador %c!!!\n", winner)
	}
}
