package main

/*
	Construa uma matriz que represente uma imagem de 10x10 pixels. Cada pixel deve conter um valor
	(gerado aleatoriamente) entre 0 e 255, representando o tom da cor presente naquele pixel. Exiba essa
	matriz na tela no formato de tabela.
*/

import (
	"fmt"
	"math/rand"
)

func main() {
	for l := 0; l < 10; l++ {
		for c := 0; c < 10; c++ {
			fmt.Printf("%3d ", rand.Intn(256))
		}
		fmt.Println()
	}
}
