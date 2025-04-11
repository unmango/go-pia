_ != mkdir -p .make

DEVCTL := go tool devctl
GINKGO := go tool ginkgo

GO_SRC != $(DEVCTL) list --go

build: .make/go-build
tidy: go.sum
docker: .make/docker-manual-connections

go.sum: go.mod ${GO_SRC}
	go mod tidy

.make/go-build: ${GO_SRC}
	go build ./...
	@touch $@

.make/docker-manual-connections: docker/manual-connections/Dockerfile
	docker build -f $< . -t unmango/pia-manual-connections:latest
