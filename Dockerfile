## Build stage
# builder - name of this stage
FROM golang:1.20-alpine AS builder 
WORKDIR /app
# first . means project dir next . means workdir
COPY . .  
RUN go build -o main main.go

## Run Stage
FROM alpine:3.16
WORKDIR /app
# copy executable binary from build stage to run stage
COPY --from=builder /app/main .
COPY app.env .

# It's act just as an documentation b/w developers
EXPOSE 8080
CMD ["/app/main"]
