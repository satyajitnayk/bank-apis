## Build stage
# builder - name of this stage
FROM golang:1.20-alpine AS builder 
WORKDIR /app
# first . means project dir next . means workdir
COPY . .  
RUN go build -o main main.go
RUN apk add curl
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.17.0/migrate.linux-amd64.tar.gz | tar xvz


## Run Stage
FROM alpine:3.16
WORKDIR /app
# copy executable binary from build stage to run stage
COPY --from=builder /app/main .
COPY --from=builder /app/migrate ./migrate
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
COPY db/migration ./db/migration

# It's act just as an documentation b/w developers
EXPOSE 8080
CMD ["/app/main"]
ENTRYPOINT [ "/app/start.sh" ]

