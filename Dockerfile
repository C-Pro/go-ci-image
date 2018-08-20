FROM golang:alpine

MAINTAINER Sergey Melekhin <sergey@melekhin.me>
RUN mkdir /cache
ENV GOCACHE /cache
VOLUME /cache

RUN apk add --no-cache git make bash postgresql-client dpkg tar
RUN go get github.com/alecthomas/gometalinter && gometalinter --install
