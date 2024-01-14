package main

import (
	"database/sql"
	"log"

	_ "github.com/lib/pq" // driver for sql
	"github.com/satyajitnayk/bank-apis/api"
	db "github.com/satyajitnayk/bank-apis/db/sqlc"
	"github.com/satyajitnayk/bank-apis/util"
)

func main() {
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	conn, err := sql.Open(config.DBDriver, config.DbSource)
	if err != nil {
		log.Fatal("Cannot connect to db:", err)
	}

	store := db.NewStore(conn)
	server := api.NewServer(store)

	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("can not start server:", err)
	}
}
