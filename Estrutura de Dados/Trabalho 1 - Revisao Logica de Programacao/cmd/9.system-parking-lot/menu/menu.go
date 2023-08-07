package menu

import (
	"fmt"
	"strconv"

	"github.com/D1360-64RC14/programming-logic-review/pkg/terminal"
	"github.com/D1360-64RC14/programming-logic-review/pkg/validation"
)

type Menu struct {
	header     string
	options    []string
	zeroOption string
}

type Alert struct {
	Type    string
	Message string
}

func New(header string, options []string, zeroOption string) *Menu {
	return &Menu{
		header,
		options,
		zeroOption,
	}
}

func NewEmpty() *Menu {
	return &Menu{
		"",
		[]string{},
		"",
	}
}

func (m *Menu) SetHeader(header string) {
	m.header = header
}

func (m *Menu) AddOption(option string) {
	m.options = append(m.options, option)
}

func (m *Menu) AddZeroOption(option string) {
	m.zeroOption = option
}

func (m *Menu) Question() (int, error) {
	return m.QuestionWithAlert(nil)
}

func (m *Menu) QuestionWithAlert(alert *Alert) (int, error) {
	fmt.Println(m.header)
	fmt.Println()

	lineCount := len(m.options)
	startingRange := 1

	if m.zeroOption != "" {
		lineCount++
		startingRange = 0
	}

	places := len(fmt.Sprint(lineCount))

	if alert != nil {
		fmt.Printf("%s: %s\n", alert.Type, alert.Message)

		fmt.Println()
	}

	for i, option := range m.options {
		fmt.Printf("[%*d] %s\n", places, i+1, option)
	}

	if m.zeroOption != "" {
		fmt.Println()
		fmt.Printf("[%*d] %s\n", places, 0, m.zeroOption)
	}

	fmt.Println()

	for {
		answerRaw, err := terminal.ReadStdin("Escolha: ")
		if err != nil {
			return 0, err
		}

		if !validation.Do(answerRaw,
			validation.ShouldNotBeEmptyString,
			validation.ShouldNotBeWhiteSpace,
			validation.CanBeConvertedToInt,
		) {
			continue
		}

		option, _ := strconv.Atoi(answerRaw)

		if !validation.Do(option,
			validation.ShouldBePositive[int],
			validation.ShouldBeInRange(startingRange, len(m.options)),
		) {
			continue
		}

		return option, nil
	}
}
