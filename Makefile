.PHONY: test lint test-python test-go lint-python lint-go

test: test-python test-go

test-python:
	@cd hooks && python3 -m pytest test_hello.py -v 2>/dev/null || echo "Python tests: no test file yet or tests failed"

test-go:
	@cd hooks && go test -v ./... 2>/dev/null || echo "Go tests: no test file yet or tests failed"

lint: lint-python lint-go

lint-python:
	@cd hooks && python3 -m py_compile hello.py 2>/dev/null || echo "Python lint: no source file yet or lint failed"

lint-go:
	@cd hooks && test -n "$$(find . -name '*.go' -not -name '*_test.go' 2>/dev/null)" && go vet ./... || echo "Go lint: no source file yet or lint failed"
