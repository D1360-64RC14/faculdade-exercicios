package validation

import "fmt"

func Do[T comparable](content T, rules ...Rule[T]) bool {
	for _, rule := range rules {
		err := rule(content)

		if err != nil {
			fmt.Printf("\nErro: %v!\n", err)
			return false
		}
	}

	return true
}
