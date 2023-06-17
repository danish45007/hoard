postgres:
	docker run --name postgres-container -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:12-alpine

createdb:
	docker exec -it postgres-container createdb --username=root --owner=root hoard_db

dropdb:
	docker exec -it postgres-container dropdb hoard_db

migrateup:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/hoard_db?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/hoard_db?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown