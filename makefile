postrges: 
	docker run --name postgres-12 -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -d postgres:12-alpine
createdb:
	sudo docker exec -it postgres-12 createdb --username=postgres --owner=postgres simple_bank
dropdb:
	sudo docker exec -it postgres-12 dropdb --username=postgres simple_bank
migrateup:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migratedown migrateup