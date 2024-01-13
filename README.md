# bank-apis

REST apis for a banking system written in go

## run postgres

```shell
# Incase you have local postgres instance running - command to stop it for MAC OS
sudo -u postgres /Library/PostgreSQL/14/bin/pg_ctl -D /Library/PostgreSQL/14/data stop

# to run command inside postgres
docker exec -it postgres12 psql -U root

# check command working in root=#
select now();

# to pull docker image for potgres
docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

# check which containers running
docker ps

# list all conatiner
docker ps -a

# remove a docker conatiner
docker rm <conatinerName/conatinerId>

# start a docker conatiner
docker start <conatinerName/conatinerId>

# stop a runnig docker conatiner
docker stop <conatinerName/conatinerId>

# go inside shell of a conatiner
docker exec -it postgres12 /bin/bash

# create a database inside shell
createdb --username=root --owner=root <db_name>

# enter into the created database
psql <db_name>

#drop database
drop <db_name>

# exit from psql
\q

# exit from shell
exit
```

## Install & use golang-migrate

```shell
brew install golang-migrate

# check version
migrate -version

# create migration file
migrate create -ext sql -dir db/migration -seq init_schema

# run migration
migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up
```

## Usage of Makefile

```shell

# create postgres instance in docker
make postgres

# create db
make createdb

...
```
