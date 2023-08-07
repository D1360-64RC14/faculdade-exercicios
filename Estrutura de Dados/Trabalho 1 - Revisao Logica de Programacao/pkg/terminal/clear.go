package terminal

import (
	"fmt"
	"os"
	"os/exec"
	"runtime"
)

var systemsClear = map[string]string{
	"windows": "cls",
	"linux":   "clear",
	"darwin":  "clear",
}

func Clear() {
	cmd, ok := systemsClear[runtime.GOOS]
	if !ok {
		fmt.Println()
	}

	clear := exec.Command(cmd)
	clear.Stdout = os.Stdout
	clear.Run()
}
