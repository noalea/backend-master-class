postgres:
	docker run --name postgres14.5 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:14.5-alpine

createdb:
	docker exec -it postgres14.5 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres14.5 dropdb --username=root --owner=root simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc