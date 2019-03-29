package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	listen, err := net.Listen("tcp", "localhost:8080")
	if err != nil {
		log.Fatal("failed listening on 8080")
	}
	log.Println("listening on 8080")
	for {
		conn, err := listen.Accept()
		if err != nil {
			log.Println("connection error")
			continue
		}
		go func() {
			var b []byte
			_, err := conn.Read(b)
			if err != nil {
				log.Println("read error")
				return
			}
			fmt.Println(string(b))
		}()
	}
}
