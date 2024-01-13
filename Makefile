postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres12 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

# .PHONY target is used to declare a list of targets that are not associated with files.
# When a target is marked as .PHONY, it tells Make that there are no actual files with 
# the same names as the targets, and it should not treat them as file dependencies.
# This is often used for targets that represent actions or tasks rather than files.
.PHONY: createdb dropdb postgres migrateup migratedown