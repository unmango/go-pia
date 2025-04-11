DEVCTL := go tool devctl
GINKGO := go tool ginkgo

GO_SRC != $(DEVCTL) list --go

build: ${GO_SRC}
	go build ./...

tidy: go.sum

go.sum: go.mod ${GO_SRC}
	go mod tidy
