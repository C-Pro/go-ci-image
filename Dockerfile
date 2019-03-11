FROM docker
FROM golang:1.11.5-alpine

MAINTAINER Sergey Melekhin <sergey@melekhin.me>
RUN mkdir /cache
ENV GOCACHE /cache
VOLUME /cache

RUN apk add --no-cache git make bash postgresql-client dpkg tar build-base
RUN go get github.com/alecthomas/gometalinter && gometalinter --install
COPY --from=0 /usr/local/bin/docker /usr/bin/docker

