package main

import (
	"os/exec"
	"strings"
	"testing"
)

func TestHelloOutput(t *testing.T) {
	cmd := exec.Command("go", "run", "hello.go")
	out, err := cmd.Output()
	if err != nil {
		t.Fatalf("failed to run hello.go: %v", err)
	}
	if !strings.Contains(string(out), "Hello from hooks experiment") {
		t.Errorf("expected output to contain 'Hello from hooks experiment', got: %s", string(out))
	}
}
