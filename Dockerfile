FROM docker
FROM golang:1.12.4-stretch

MAINTAINER Sergey Melekhin <sergey@melekhin.me>
RUN mkdir /cache
ENV GOCACHE /cache
VOLUME /cache

RUN apt update && apt install -y git make postgresql-client
RUN GO111MODULE=on go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.16.0
COPY --from=0 /usr/local/bin/docker /usr/bin/docker

