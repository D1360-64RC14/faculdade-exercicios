package main

/*
	Elabore um programa que receba um número do usuário e retorne a tabuada daquele número.
*/

import (
	"fmt"
	"strconv"

	"github.com/D1360-64RC14/programming-logic-review/pkg/terminal"
)

func main() {
	numRaw, err := terminal.ReadStdin("Informe um número: ")
	terminal.ExitIfErr(err)

	num, err := strconv.Atoi(numRaw)
	terminal.ExitIfErr(err)

	numberLen := len(fmt.Sprint(num))

	fmt.Println()
	fmt.Printf("A tabuada do número %d é:\n", num)

	for i := 0; i <= 10; i++ {
		fmt.Printf(
			"    %[1]*[3]d x %2[4]d = %[2]*[5]d\n",
			numberLen, numberLen+1,
			num, i, num*i,
		)
	}
}
