package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"

	"github.com/charmbracelet/log"
	"github.com/spf13/pflag"
	"github.com/unmango/go-pia"
	"github.com/unmango/go/cli"
)

var bindAddr string

func main() {
	pflag.StringVar(&bindAddr, "bind-addr", "", "")
	pflag.Parse()

	if bindAddr == "" {
		cli.Fail("--bind-addr is required")
	}

	http.HandleFunc("/api/client/v2/token", handleToken)

	log.Infof("Serving on %s", bindAddr)
	if err := http.ListenAndServe(bindAddr, nil); err != nil {
		cli.Fail(err)
	}
}

func handleToken(w http.ResponseWriter, r *http.Request) {
	log.Info("Proxying token request")
	res := pia.TokenResponse{
		Token: os.Getenv("PIA_PROXY_TOKEN"),
	}

	enc := json.NewEncoder(w)
	if err := enc.Encode(res); err != nil {
		fmt.Fprintf(w, "Failed to encode response: %s", err)
	}
}
