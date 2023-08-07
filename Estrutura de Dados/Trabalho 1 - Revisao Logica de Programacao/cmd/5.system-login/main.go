package main

/*
	Elabore um programa que simule um sistema de acesso com login e senha. O usuário deve informar
	seu login e, em seguida, tem 3 tentativas para acertar a senha padrão (Considere a senha padrão
	"senhapoucosegura"). Após a inserção da senha, considere:

	  - Caso o usuário acerte a senha, uma mensagem de boas-vindas (contendo o nome do usuário) deve
	ser exibida;

	  - Caso erre pela primeira ou segunda vez, deverá ser mostrada uma mensagem informando o erro
	e o número de tentativas de acesso restantes;

	  - Caso erre pela terceira vez, a mensagem mostrada deverá informar o bloqueio daquele usuário por
	excesso de tentativas de acesso.
*/

import (
	"fmt"
	"strings"

	"github.com/D1360-64RC14/programming-logic-review/pkg/presentation"
	"github.com/D1360-64RC14/programming-logic-review/pkg/terminal"
	"github.com/D1360-64RC14/programming-logic-review/pkg/validation"
)

const PASSWORD = "senhapoucosegura"
const MAX_TRIES = 3

func main() {
	var username string

	for {
		var err error

		username, err = terminal.ReadStdin("Informe seu nome de usuário: ")
		terminal.ExitIfErr(err)

		if validation.Do(username,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
		) {
			break
		}
	}

	username = strings.Trim(username, " ")

	successLogin := false

	for try := 1; try <= MAX_TRIES && !successLogin; try++ {
		var password string

		for {
			var err error

			password, err = terminal.ReadStdin(
				fmt.Sprintf("Informe sua senha [%d/%d]: ", try, MAX_TRIES),
			)
			terminal.ExitIfErr(err)

			if validation.Do(password,
				validation.ShouldNotBeEmptyString,
				validation.ShouldNotBeWhiteSpace,
			) {
				break
			}
		}

		if password != PASSWORD {
			fmt.Println("\nSenha errada. Tente novamente...")
			continue
		}

		successLogin = true
	}

	terminal.Clear()

	if successLogin {
		PresentationWithName(username)
	} else {
		AccountBlocked(username)
	}
}

func PresentationWithName(name string) {
	p := presentation.NewEmpty('=', 2)

	p.PushText("Bem Vindo ao Banco Cubbo,")
	p.PushText(name)
	p.Println()
}

func AccountBlocked(name string) {
	p := presentation.NewEmpty('=', 2)

	p.PushText("Banco Cubbo")
	p.PushDecoration()
	p.PushText(name + ", sua conta foi")
	p.PushText("bloqueada por excesso de tentativas.")
	p.PushText("Tente novamente após 24 horas!")
	p.Println()
}
