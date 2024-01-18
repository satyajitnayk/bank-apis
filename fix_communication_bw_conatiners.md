## Communication b/w 2 different containers

We are possibly getting error

```shell
dial tcp 127.0.0.1:5432: connect: connection refused
```

### possible cause - containers are running in 2 differnt IP' addresses

| Container1                              | Container2                              |
| --------------------------------------- | --------------------------------------- |
| ![conatiner1](assets/conatiner1_ip.png) | ![conatiner2](assets/conatiner2_ip.png) |

### Possible Solutions

1. Using container IP:

```shell
# check n/w config of a conatiner
# IP_OF_POSTGRES_CONSTAINER can be found using below command as shown in above images
docker container inspect <<conatiner_name/id>

# To fix connection error b/w conatiners(This is not ideal as IP could chnage over time)
docker run --name simplebank -p 8080:8080 -e GIN_MODE=release -e DB_SOURCE="postgresql://root:secret@<IP_OF_POSTGRES_CONSTAINER>:5432/simple_bank?sslmode=disable" simplebank:latest
```

2. Using bridge network

- put both conatiners in same n/w, then they ca communicate.

```shell
# List all n/w used by docker
docker network ls

# get detail about a specific n/w
docker network inspect <networkName>

# create a new network
docker network create bank-network

# connect a conatiner to a network
docker network connect bank-network postgres12

# run both conatiner in same network
docker run --name simplebank --network bank-network -p 8080:8080 -e GIN_MODE=release  -e DB_SOURCE="postgresql://root:secret@postgres12:5432/simple_bank?sslmode=disable" simplebank:latest
```

- **since both runnig on same n/w we can connect to postgres using conatiner name instead of IP address**
  ![both runnig on same n/w](assets/server_and_postgres_running_in_same_nw.png)

- continer running on bridge n/w
  ![conatiner1](assets/conatiners_running_on_bridge_network.png)
