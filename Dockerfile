FROM golang:alpine

MAINTAINER Sergey Melekhin <sergey@melekhin.me>

RUN apk add --no-cache git make bash postgresql-client
RUN go get github.com/alecthomas/gometalinter && gometalinter --install
