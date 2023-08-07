package main

/*
	Faça um programa que realize o controle de um estacionamento com capacidade para 10 carros. Essa
	classe deve ser controlada por um menu (executando em loop) que permita ao usuário:

	  - Adicionar um novo carro. Nesse caso, o usuário deve fornecer o número da vaga e a placa do carro.
	Caso a vaga esteja livre, o carro deve ser estacionado nela; caso contrário, o usuário deve ser
	informado.

	  - Liberar um carro. O usuário deve fornecer o número da vaga, e a vaga correspondente deve ser
	desocupada.

	  - Verificar o status. Essa opção deve retornar a ocupação atual do estacionamento no formato "número
	da vaga - Placa do carro" para as vagas ocupadas, ou "número da vaga - Vazio" para as vagas vazias.

	  - Sair do programa.
*/

import (
	"fmt"
	"strconv"
	"strings"

	"github.com/D1360-64RC14/programming-logic-review/cmd/9.system-parking-lot/menu"
	parkinglot "github.com/D1360-64RC14/programming-logic-review/cmd/9.system-parking-lot/parking-lot"
	"github.com/D1360-64RC14/programming-logic-review/pkg/presentation"
	"github.com/D1360-64RC14/programming-logic-review/pkg/terminal"
	"github.com/D1360-64RC14/programming-logic-review/pkg/validation"
)

const (
	OP_EXIT        = iota
	OP_ADD_CAR     = iota
	OP_RELEASE_CAR = iota
	OP_STATUS      = iota
)

var title = presentation.New('=', 4, []presentation.Line{
	presentation.Text("Super Gerenciador de"),
	presentation.Text("Estacionamentos"),
}).String()

var parkingLot = parkinglot.New(10)

var mainMenu = menu.New(
	fmt.Sprintf("%s\nO quê deseja fazer?", title),
	[]string{
		"Adicionar carro",
		"Liberar carro",
		"Verificar status",
	},
	"Sair do programa",
)

func main() {
	var lastAlert *menu.Alert = nil
	inTheSystem := true

	for inTheSystem {
		terminal.Clear()
		option, err := mainMenu.QuestionWithAlert(lastAlert)
		terminal.ExitIfErr(err)

		switch option {
		case OP_ADD_CAR:
			lastAlert = ProcedureAddCar()
		case OP_RELEASE_CAR:
			lastAlert = ProcedureReleaseCar()
		case OP_STATUS:
			lastAlert = ProcedureCheckStatus()
		case OP_EXIT:
			var exited bool
			exited, lastAlert = ProcedureExit()
			inTheSystem = !exited
		}
	}
}

func ProcedureAddCar() *menu.Alert {
	terminal.Clear()

	fmt.Println(title)

	if parkingLot.IsFull() {
		return &menu.Alert{
			Type:    "Erro",
			Message: "o estacionamento está cheio no momento",
		}
	}

	var slot int
	var plate string

	freeSlots := parkingLot.FreeSlots()
	freeSlotsStr := make([]string, len(freeSlots))
	for i, slot := range freeSlots {
		freeSlotsStr[i] = fmt.Sprint(slot)
	}

	fmt.Println("Vagas livres:", strings.Join(freeSlotsStr, ", "))
	fmt.Println()

	for {
		rawAnswer, err := terminal.ReadStdin("Escolha uma vaga para o carro: ")
		terminal.ExitIfErr(err)

		if !validation.Do(rawAnswer,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
			validation.CanBeConvertedToInt,
		) {
			continue
		}

		slot, _ = strconv.Atoi(rawAnswer)

		if !parkingLot.IsValidSlot(slot) {
			fmt.Println("\nErro: vaga inválida")
			continue
		}
		if is, _ := parkingLot.IsOccupied(slot); is {
			fmt.Println("\nErro: vaga já ocupada")
			continue
		}

		break
	}

	terminal.Clear()
	fmt.Println(title)

	for {
		rawAnswer, err := terminal.ReadStdin("Informe a placa do carro: ")
		terminal.ExitIfErr(err)

		if !validation.Do(rawAnswer,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
		) {
			continue
		}

		plate = rawAnswer
		break
	}

	err := parkingLot.Add(parkinglot.Car{Plate: plate}, slot)
	if err != nil {
		return &menu.Alert{
			Type:    "Erro",
			Message: err.Error(),
		}
	}

	return &menu.Alert{
		Type:    "Info",
		Message: "veículo adicionado com sucesso",
	}
}

func ProcedureReleaseCar() *menu.Alert {
	if len(parkingLot.OccupiedSlots()) == 0 {
		return &menu.Alert{
			Type:    "Info",
			Message: "não há carros no estacionamento",
		}
	}

	terminal.Clear()

	fmt.Println(title)

	fmt.Println("Vagas ocupadas:")
	fmt.Println()

	biggerUsedSlotNumber := 0
	for slot, car := range parkingLot.Slots() {
		if car == nil {
			continue
		}

		if slot+1 > biggerUsedSlotNumber {
			biggerUsedSlotNumber = slot + 1
		}
	}

	paddingSize := len(fmt.Sprint(biggerUsedSlotNumber))
	for slot, car := range parkingLot.Slots() {
		if car == nil {
			continue
		}

		fmt.Printf("[%*d] %s\n", paddingSize, slot+1, car.Plate)
	}

	fmt.Println("\n[0] Cancelar operação")
	fmt.Println()

	var slot int
	for {
		answer, err := terminal.ReadStdin("Qual vaga deseja liberar?: ")
		terminal.ExitIfErr(err)

		if !validation.Do(answer,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
			validation.CanBeConvertedToInt,
		) {
			continue
		}

		slot, _ = strconv.Atoi(answer)

		if slot == 0 {
			return nil
		}

		if !parkingLot.IsValidSlot(slot) {
			fmt.Println("\nErro: vaga inválida")
			continue
		}

		if is, _ := parkingLot.IsOccupied(slot); !is {
			fmt.Println("\nErro: vaga não ocupada")
			continue
		}

		break
	}

	parkingLot.Release(slot)
	return &menu.Alert{
		Type:    "Info",
		Message: "vaga liberada com sucesso",
	}
}

func ProcedureCheckStatus() *menu.Alert {
	terminal.Clear()

	fmt.Println(title)

	fmt.Println("Atual status do estacionamento:")
	fmt.Println()

	paddingPlaces := len(fmt.Sprint(parkingLot.Size()))
	for slot, car := range parkingLot.Slots() {
		if car == nil {
			fmt.Printf("  Vaga %*d: <VAZIO>\n", paddingPlaces, slot+1)
		} else {
			fmt.Printf("  Vaga %*d: %s\n", paddingPlaces, slot+1, car.Plate)
		}
	}

	fmt.Println()
	terminal.ReadStdin("Pressione [enter] para continuar...")

	return nil
}

func ProcedureExit() (bool, *menu.Alert) {
	terminal.Clear()

	fmt.Println(title)

	fmt.Println("Obrigado por utilizar nosso sistema!")
	fmt.Println()

	return true, nil
}
