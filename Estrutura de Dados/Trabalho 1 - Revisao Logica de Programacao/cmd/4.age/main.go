package main

/*
	Para se aposentar em 2023, as mulheres precisam ter na soma Idade + Tempo de Contribuição um
	total de 89 anos. Além disso, o Tempo de Contribuição deve ser no mínimo de 30 anos. Já para os
	homens, a soma deve ser de 99 anos, com no mínimo 35 anos de contribuição. Sabendo disso, elabore
	um programa que receba do usuário seu sexo, idade e tempo de contribuição, e retorne se o usuário em
	questão pode ou não se aposentar em 2023.
*/

import (
	"fmt"
	"strconv"
	"strings"

	"github.com/D1360-64RC14/programming-logic-review/pkg/terminal"
	"github.com/D1360-64RC14/programming-logic-review/pkg/validation"
)

type Sex int

const (
	SEX_FEMALE = Sex(iota)
	SEX_MALE   = Sex(iota)
)

type ContribuitionTime struct {
	MinAid int
	MinSum int
}

var femaleContribuitionTime = ContribuitionTime{30, 89}
var maleContribuitionTime = ContribuitionTime{35, 98}

func main() {
	sex, err := QuestionSex()
	terminal.ExitIfErr(err)

	age, err := QuestionAge()
	terminal.ExitIfErr(err)

	var contr int
	for {
		var err error
		contr, err = QuestionContribuitionTime()
		terminal.ExitIfErr(err)

		if age < contr {
			fmt.Println("\nErro: o tempo de contribuição não pode ser maior que a idade")
			continue
		}

		break
	}

	fmt.Println()
	switch sex {
	case SEX_FEMALE:
		ProcessWith(age, contr, femaleContribuitionTime)
	case SEX_MALE:
		ProcessWith(age, contr, maleContribuitionTime)
	}
}

func QuestionSex() (Sex, error) {
	for {
		answer, err := terminal.ReadStdin("Informe seu sexo [F, M]: ")
		if err != nil {
			return 0, err
		}

		answer = strings.TrimSpace(answer)
		answer = strings.ToLower(answer)

		if validation.Do(answer,
			validation.ShouldBeAnyOfString("f", "m", "feminino", "masculino"),
		) {
			switch answer[0] {
			case 'f':
				return SEX_FEMALE, nil
			case 'm':
				return SEX_MALE, nil
			}
		}
	}
}

func QuestionAge() (int, error) {
	for {
		answer, err := terminal.ReadStdin("Informe sua idade: ")
		if err != nil {
			return 0, err
		}

		if !validation.Do(answer,
			validation.CanBeConvertedToInt,
		) {
			continue
		}

		age, _ := strconv.Atoi(answer)

		if !validation.Do(age,
			validation.ShouldBePositive[int],
		) {
			continue
		}

		return age, nil
	}
}

func QuestionContribuitionTime() (int, error) {
	for {
		answer, err := terminal.ReadStdin("Informe seu tempo de contribuição: ")
		if err != nil {
			return 0, err
		}

		if !validation.Do(answer,
			validation.CanBeConvertedToInt,
		) {
			continue
		}

		contr, _ := strconv.Atoi(answer)

		if !validation.Do(contr,
			validation.ShouldBePositive[int],
		) {
			continue
		}

		return contr, nil
	}
}

func ProcessWith(age int, contribuitionTime int, requiredContribuitionTime ContribuitionTime) {
	if contribuitionTime < requiredContribuitionTime.MinAid {
		fmt.Println("Você não pode se aposentar em 2023, pois")
		fmt.Println("não cumpre o tempo mínimo de contribuição.")
		return
	}

	if age+contribuitionTime < requiredContribuitionTime.MinSum {
		fmt.Println("Você não pode se aposentar em 2023, pois")
		fmt.Println("não cumpre a idade necessária relatvo")
		fmt.Println("ao seu tempo de contribuição.")
		return
	}

	fmt.Println("Você poderá se aposentar em 2023")
}
