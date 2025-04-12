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

If you are more interested in the docker image, run:

```shell
docker run --rm -it unstoppablemango/pia-manual-connections:latest
```

## Disclaimer

This package is primarily based off of <https://github.com/pia-foss/manual-connections>.
The utilities provided attempt to mimic (or directly use) the functionality of the shell scripts.

Eventually I would like this to be a more general purpose library for interacting with PIA.
Currently I only need the functionality from <github.com/pia-foss/manual-connections>, so I haven't dug into how well documented their public APIs are.

## Docker

The `unstoppablemango/pia-manual-connections` docker image defined in [Dockerfile](./docker/manual-connections/Dockerfile) zips up <github.com/pia-foss/manual-connections> into a neat little container for easy consumption.
The repository is located at `/src` with the entrypoint defined as [entrypoint.sh](./docker/manual-connections/entrypoint.sh), which sources [/src/run_setup.sh](https://github.com/pia-foss/manual-connections/blob/master/run_setup.sh).
A minimal set of configuration variables required to run the script can be found at [pia-foss/manual-connections](https://github.com/pia-foss/manual-connections/#automated-setup).

### Configuration

The supported environment variables are defined at [pia-foss/manual-connections](https://github.com/pia-foss/manual-connections/#automated-setup).
