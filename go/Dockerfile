# syntax=docker/dockerfile:1

# Build
FROM golang:1.18-buster AS build

WORKDIR /app

COPY go.mod ./
# COPY go.sum ./

RUN go mod download

COPY cmd/*.go ./cmd/

RUN go build -o /main ./cmd/main.go

# Run
FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /main /main

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["./main"]
