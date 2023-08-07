package main

/*
	A partir do exercício anterior, determine o número de vitórias e empates necessários para o lanterna
	igualar a pontuação do líder. Observação: cada empate conta 1 ponto.
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
	winsToLanternaApproch := math.Floor(float64(offset) / 3.0)
	tiesToLanternaEqual := offset % 3

	fmt.Print("\nO lanterna precisará de ")

	if winsToLanternaApproch != 0 {
		fmt.Printf("%d ", int(winsToLanternaApproch))
		if winsToLanternaApproch == 1 {
			fmt.Print("vitória ")
		} else {
			fmt.Print("vitórias ")
		}
	}
	if winsToLanternaApproch != 0 && tiesToLanternaEqual != 0 {
		fmt.Print("e ")
	}
	if tiesToLanternaEqual != 0 {
		fmt.Printf("%d ", tiesToLanternaEqual)
		if tiesToLanternaEqual == 1 {
			fmt.Print("empate ")
		} else {
			fmt.Print("empates ")
		}
	}

	fmt.Println("para igualar à pontuação do líder.")
}
