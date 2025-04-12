_ != mkdir -p .make

DEVCTL := go tool devctl
GINKGO := go tool ginkgo

GO_SRC != $(DEVCTL) list --go

DOCKER_SRC := \
	docker/manual-connections/Dockerfile \
	docker/manual-connections/entrypoint.sh

test: .make/go-test
build: .make/go-build
tidy: go.sum
docker: .make/docker-manual-connections

go.sum: go.mod ${GO_SRC}
	go mod tidy

.make/go-build: ${GO_SRC}
	go build ./...
	@touch $@

.make/go-test: ${GO_SRC} ${DOCKER_SRC}
	$(GINKGO) $(sort $(dir $?))
	@touch $@

.make/docker-manual-connections: ${DOCKER_SRC}
	docker build -f $< . -t unmango/pia-manual-connections:latest
