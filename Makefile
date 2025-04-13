_ != mkdir -p .make bin

DEVCTL := go tool devctl
GINKGO := go tool ginkgo

GO_SRC != $(DEVCTL) list --go

test: .make/go-test
build: .make/go-build bin/proxy
tidy: go.sum

bin/proxy: ${GO_SRC} go.mod
	go build -o $@ ./cmd/proxy

go.sum: go.mod ${GO_SRC}
	go mod tidy

.make/go-build: ${GO_SRC}
	go build ./...
	@touch $@

.make/go-test: ${GO_SRC} ${DOCKER_SRC}
	$(GINKGO) $(sort $(dir $?))
	@touch $@
