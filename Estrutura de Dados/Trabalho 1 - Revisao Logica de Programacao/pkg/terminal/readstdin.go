package terminal

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func ReadStdin(text string) (string, error) {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print(text)
	output, err := reader.ReadString('\n')
	if err != nil {
		return "", err
	}

	return strings.TrimRight(output, "\n"), nil
}
