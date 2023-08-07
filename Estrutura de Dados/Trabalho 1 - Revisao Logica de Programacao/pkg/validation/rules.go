package validation

import (
	"errors"
	"fmt"
	"strconv"
	"strings"

	"golang.org/x/exp/constraints"
)

func ShouldNotBeEmptyString(content string) error {
	if len(content) == 0 {
		return errors.New("não pode ser vazio")
	}
	return nil
}

func ShouldNotBeWhiteSpace(content string) error {
	if len(strings.Trim(content, " ")) == 0 {
		return errors.New("não pode conter apenas espaços")
	}
	return nil
}

func ShouldBeAnyOfString(options ...string) Rule[string] {
	return func(content string) error {
		matchSomeOption := false
		for _, option := range options {
			if option == content {
				matchSomeOption = true
				break
			}
		}

		if matchSomeOption {
			return nil
		}

		return errors.New("entrada inválida")
	}
}

func CanBeConvertedToInt(content string) error {
	_, err := strconv.Atoi(content)
	if err != nil {
		return errors.New("o valor deve ser um número inteiro")
	}
	return nil
}

func ShouldBePositive[Number constraints.Integer | constraints.Float](content Number) error {
	if content >= 0 {
		return nil
	}

	return errors.New("o valor deve ser positivo")
}

func ShouldBeInRange[Number constraints.Integer | constraints.Float](from Number, to Number) Rule[Number] {
	return func(content Number) error {
		if content >= from && content <= to {
			return nil
		}

		return fmt.Errorf("o valor deve estar no intervalo de %v a %v", from, to)
	}
}

func CanBeConvertedToFloat(content string) error {
	_, err := strconv.ParseFloat(content, 64)
	if err != nil {
		return errors.New("o valor deve ser um némero real ou inteiro")
	}
	return nil
}
