package terminal

import (
	"fmt"
	"os"
)

func ExitIfErr(err error) {
	if err == nil {
		return
	}

	fmt.Println("Ocorreu algum erro inesperado")
	fmt.Print(err.Error())
	os.Exit(1)
}
