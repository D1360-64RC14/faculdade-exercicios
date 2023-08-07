package main

/*
	Em determinada disciplina a avaliação é feita com duas provas e um projeto, todos avaliados de 0 a
	10 pontos. Para o cálculo da média final (MF) a média aritmética simples das duas provas tem peso 7
	e a nota do projeto peso 3. Os estudantes serão considerados aprovados caso a MF seja maior ou igual
	a 6 pontos e reprovados caso contrário. Com base no descrito, escreva um programa que receba do
	usuário o nome do aluno e as notas de suas 3 avaliações e retorne uma saída no formato: "Nome - MF
	- Situação" (onde situação é "Aprovado" ou "Reprovado").
*/

import (
	"fmt"
	"strconv"
	"strings"

	"github.com/D1360-64RC14/programming-logic-review/pkg/terminal"
	"github.com/D1360-64RC14/programming-logic-review/pkg/validation"
)

const WEIGHT_EXAM = 0.7
const WEIGHT_HOMEWORK = 1 - WEIGHT_EXAM

const STATE_APROVED = "Aprovado"
const STATE_FAILED = "Reprovado"

func main() {
	name, err := QuestionName("Informe o nome do aluno: ")
	terminal.ExitIfErr(err)

	examGrade1, err := QuestionGrade("Informe a nota da 1ª prova [0-10]: ")
	terminal.ExitIfErr(err)

	examGrade2, err := QuestionGrade("Informe a nota da 2ª prova [0-10]: ")
	terminal.ExitIfErr(err)

	homeworkGrade, err := QuestionGrade("Informe a nota do seu trabalho [0-10]: ")
	terminal.ExitIfErr(err)

	meanExamGrade := (examGrade1 + examGrade2) / 2

	weightedExamGrade := meanExamGrade * WEIGHT_EXAM
	weightedHomeworkGrade := homeworkGrade * WEIGHT_HOMEWORK

	finalGrade := weightedExamGrade + weightedHomeworkGrade

	situation := STATE_FAILED
	if finalGrade >= 6 {
		situation = STATE_APROVED
	}

	fmt.Printf(
		"\n%s - %.2f - %s\n",
		name, finalGrade, situation,
	)
}

func QuestionName(question string) (string, error) {
	for {
		name, err := terminal.ReadStdin(question)
		if err != nil {
			return "", err
		}

		if !validation.Do(name,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
		) {
			continue
		}

		return strings.Trim(name, " "), nil
	}
}

func QuestionGrade(question string) (float32, error) {
	for {
		gradeStr, err := terminal.ReadStdin(question)
		if err != nil {
			return 0, err
		}

		if !validation.Do(gradeStr,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
			validation.CanBeConvertedToFloat,
		) {
			continue
		}

		grade, _ := strconv.ParseFloat(gradeStr, 32)

		if !validation.Do(grade,
			validation.ShouldBeInRange(0.0, 10.0),
		) {
			continue
		}

		return float32(grade), nil
	}
}
