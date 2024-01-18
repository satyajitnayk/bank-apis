DB_URL=postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable

network:
	docker network create bank-network

postgres:
	docker run --name postgres --network bank-network -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres dropdb simple_bank

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migrateup1:
	migrate -path db/migration -database "$(DB_URL)" -verbose up 1

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

migratedown1:
	migrate -path db/migration -database "$(DB_URL)" -verbose down 1

sqlc:
	sqlc generate

# run unit tests
test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/satyajitnayk/bank-apis/db/sqlc Store

# .PHONY target is used to declare a list of targets that are not associated with files.
# When a target is marked as .PHONY, it tells Make that there are no actual files with 
# the same names as the targets, and it should not treat them as file dependencies.
# This is often used for targets that represent actions or tasks rather than files.
.PHONY: network createdb dropdb postgres migrateup migratedown migrateup1 migratedown1 sqlc test server mock