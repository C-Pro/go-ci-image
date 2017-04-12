FROM golang:alpine

MAINTAINER Sergey Melekhin <sergey@melekhin.me>

RUN apk add --no-cache git make bash
RUN go get github.com/alecthomas/gometalinter && gometalinter --install
