# go-pia

Utilities for programmatically interacting with [Private Internet Access](https://www.privateinternetaccess.com/) in [Go](https://go.dev).

## Getting Started

To start using the package, run:

```shell
go get github.com/unmango/go-pia
```

Create a new client with:

```go
c := pia.NewClient()
s, err := c.Servers(context.Background())
```

## Disclaimer

This package is primarily based off of <https://github.com/pia-foss/manual-connections>.
The utilities provided attempt to mimic (or directly use) the functionality of the shell scripts.

Eventually I would like this to be a more general purpose library for interacting with PIA.
Currently I only need the functionality from <https://github.com/pia-foss/manual-connections>, so I haven't dug into how well documented their public APIs are.

## Docker

The `unstoppablemango/pia-manual-connections` docker image contains the upstream repo for convenience in containerized workloads.
The source repo for this image can be found [here](https://github.com/UnstoppableMango/pia-manual-connections).
