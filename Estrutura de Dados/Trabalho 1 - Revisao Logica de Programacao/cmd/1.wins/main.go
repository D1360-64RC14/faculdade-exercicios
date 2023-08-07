package main

/*
	Elabore um programa que a partir das pontuações do líder e do lanterna de um campeonato de
	futebol mostre quantas vitórias são necessárias para que o lanterna iguale ou ultrapasse o líder na
	classificação.
	Observações:
	  - Cada vitória conta 3 pontos;
	  - O usuário deve fornecer as pontuações;
	  - O usuário deve ser notificado do erro caso a pontuação do líder seja inferior à do lanterna;
	  - No caso anterior, deve-se solicitar que o usuário insira novos valores.
*/

import (
	"fmt"
	"math"
	"strconv"

	"github.com/D1360-64RC14/programming-logic-review/pkg/terminal"
	"github.com/D1360-64RC14/programming-logic-review/pkg/validation"
)

func main() {
	var lanternaPoints int
	var liderPoints int

	for {
		lanterna, err := terminal.ReadStdin("Informe a pontuação do lanterna: ")
		terminal.ExitIfErr(err)

		if !validation.Do(lanterna,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
			validation.CanBeConvertedToInt,
		) {
			continue
		}

		lanternaPoints, _ = strconv.Atoi(lanterna)

		if !validation.Do(lanternaPoints,
			validation.ShouldBePositive[int],
		) {
			continue
		}

		break
	}

	for {
		lider, err := terminal.ReadStdin("Informe a pontuação do líder: ")
		terminal.ExitIfErr(err)

		if !validation.Do(lider,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
			validation.CanBeConvertedToInt,
		) {
			continue
		}

		liderPoints, _ = strconv.Atoi(lider)

		if !validation.Do(liderPoints,
			validation.ShouldBePositive[int],
		) {
			continue
		}

		if liderPoints < lanternaPoints {
			fmt.Println("\nErro: a pontuação do líder deve ser maior que a do lanterna")
			continue
		}

		break
	}

	offset := liderPoints - lanternaPoints
	winsToLanternaPass := math.Ceil(float64(offset) / 3.0)

	fmt.Printf("\nO lanterna precisará vencer %d ", int(winsToLanternaPass))

	if winsToLanternaPass == 1.0 {
		fmt.Print("vez")
	} else {
		fmt.Print("vezes")
	}

	fmt.Println(" para passar ou igualar à pontuação do líder!")
}
