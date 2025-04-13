_ != mkdir -p .make

DEVCTL := go tool devctl
GINKGO := go tool ginkgo

GO_SRC != $(DEVCTL) list --go

test: .make/go-test
build: .make/go-build
tidy: go.sum

go.sum: go.mod ${GO_SRC}
	go mod tidy

.make/go-build: ${GO_SRC}
	go build ./...
	@touch $@

.make/go-test: ${GO_SRC} ${DOCKER_SRC}
	$(GINKGO) $(sort $(dir $?))
	@touch $@
