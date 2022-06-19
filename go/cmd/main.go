package main

import (
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()

	healthCheckHandler := func(w http.ResponseWriter, r *http.Request) {
		log.Println("[GET] health check")
		w.Write([]byte("OK!!"))
	}

	mux.HandleFunc("/", healthCheckHandler)

	s := http.Server{
		Addr:    ":8080",
		Handler: mux,
	}

	log.Printf("Listen HTTP Server")
	if err := s.ListenAndServe(); err != nil {
		log.Fatal(err)
	}
}
