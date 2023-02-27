.PHONY: clean
clean:
	$(call print-target)
	rm -rf out

.PHONY: generate
generate:
	$(call print-target)
	go generate ./...

.PHONY: run
run:
	$(call print-target)
	go run cmd/example/*

.PHONY: fmt
fmt:
	$(call print-target)
	go fmt ./...

.PHONY: update
update:
	$(call print-target)
	go get -u ./...
	go mod tidy

.PHONY: build
build:
	$(call print-target)
	go build -v ./...

.PHONY: test
test:
	$(call print-target)
	go test -v -race ./...

.PHONY: coverage
coverage:
	$(call print-target)
	mkdir -p out
	go test -v -race -coverprofile=out/coverage.txt -covermode=atomic -coverpkg=./... ./...
	go tool cover -html=out/coverage.txt -o out/coverage.html

.PHONY: benchmark
benchmark:
	$(call print-target)
	go test -bench=. ./...

.PHONY: lint
lint:
	$(call print-target)
	golangci-lint run --fix ./...

.PHONY: verify
verify: generate build test
	$(call print-target)
	pre-commit run --all-files


define print-target
    @printf "[Make] executing target: \033[36m$@\033[0m\n"
endef
