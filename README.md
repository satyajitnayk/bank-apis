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
```
