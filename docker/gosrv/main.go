package main

import (
	"fmt"
	"net/http"

	"goji.io"
	"goji.io/pat"
)

func hello(w http.ResponseWriter, r *http.Request) {
	name := pat.Param(r, "name")
	fmt.Fprintf(w, "Hello, %s!", name)
}

func main() {
	mux := goji.NewMux()
	mux.HandleFunc(pat.Get("/hello/:name"), hello)

	err := http.ListenAndServe("0.0.0.0:8000", mux)
	if err != nil {
		println(err.Error())
	}
}
